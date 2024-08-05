import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:path/path.dart' as p;

final _clientRegex = RegExp(r'class \$Client extends _i[0-9]*.DynamiteClient {');

const String _idField = 'appID';

class _State {
  _State(this._filePath);

  final String _filePath;
  late final String _basename = p.basename(_filePath);

  /// The unescaped app name.
  late String clientID = _basename.substring(0, _basename.length - 13);

  /// The dart version of [clientID].
  late String dartName = toDartName(clientID);

  /// The class name version of [clientID].
  late String className = toDartName(clientID, className: true);

  late bool hasHelpers = File('lib/src/api/$clientID/${clientID}_helpers.dart').existsSync();
  late bool hasClient = File(_filePath).readAsStringSync().contains(_clientRegex);
}

void main() {
  final files = Glob('lib/src/api/**/*.openapi.dart').listSync()..sort((a, b) => a.path.compareTo(b.path));

  final formatter = DartFormatter(pageWidth: 120);
  final emitter = DartEmitter(
    orderDirectives: true,
    useNullSafetySyntax: true,
  );

  final states = BuiltList<_State>.build((b) {
    for (final file in files) {
      b.add(_State(file.path));
    }
  });

  for (final state in states) {
    final library = _buildClientExports(state);
    final output = library.accept(emitter).toString();
    File('lib/${state.clientID}.dart').writeAsStringSync(
      formatter.format(output),
    );
  }

  final library = Library((b) {
    final appIDBuilder = ClassBuilder()
      ..docs.add('/// IDs of the apps.')
      ..annotations
          .add(refer('Deprecated').call([refer("\"Use 'appID' from 'package:nextcloud/<id>.dart' instead.\"")]))
      ..name = 'AppIDs'
      ..modifier = ClassModifier.final$;

    for (final state in states) {
      final clientID = state.clientID;

      b.directives.add(Directive.import('package:nextcloud/$clientID.dart', as: '_$clientID'));

      final appID = Field((b) {
        b
          ..docs.add('/// ID for the $clientID app.')
          ..static = true
          ..modifier = FieldModifier.constant
          ..type = refer('String')
          ..name = state.dartName
          ..assignment = refer('_$clientID.$_idField').code;
      });

      appIDBuilder.fields.add(appID);
    }

    b.body.add(appIDBuilder.build());
  });

  final output = library.accept(emitter).toString();

  File('lib/src/app_ids.dart').writeAsStringSync(
    formatter.format(output),
  );
}

Library _buildClientExports(_State state) {
  final clientID = state.clientID;
  final dartName = state.dartName;

  return Library((b) {
    b.directives.add(
      Directive.export('package:nextcloud/src/api/$clientID/$clientID.openapi.dart'),
    );

    if (state.hasHelpers) {
      b.directives.add(
        Directive.export('package:nextcloud/src/api/$clientID/${clientID}_helpers.dart'),
      );
    }

    final appID = Field((b) {
      b
        ..docs.add('/// ID for the $clientID app.')
        ..modifier = FieldModifier.constant
        ..type = refer('String')
        ..name = _idField
        ..assignment = literalString(clientID).code;
    });

    b.body.add(appID);

    if (state.hasClient) {
      b.directives.addAll([
        Directive.import('package:nextcloud/src/api/$clientID/$clientID.openapi.dart'),
        Directive.import('package:nextcloud/src/nextcloud_client.dart'),
      ]);

      final docs = '/// Client for the $clientID APIs.';

      final expando = Field((b) {
        b
          ..static = true
          ..modifier = FieldModifier.final$
          ..name = '_$dartName'
          ..assignment = const Code(r'Expando<$Client>()');
      });

      final clientGetter = Method((b) {
        b
          ..docs.add(docs)
          ..returns = refer(r'$Client')
          ..type = MethodType.getter
          ..name = dartName
          ..lambda = true
          ..body = Code('_$dartName[this] ??= \$Client.fromClient(this)');
      });

      final extension = Extension((b) {
        b
          ..docs.add(docs)
          ..name = '${state.className}Extension'
          ..on = refer('NextcloudClient')
          ..fields.add(expando)
          ..methods.add(clientGetter);
      });

      b.body.add(extension);
    }
  });
}

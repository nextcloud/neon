import 'dart:convert';
import 'dart:typed_data';

import 'package:mocktail/mocktail.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/client_implementation.dart';
import 'package:neon/src/settings/models/exportable.dart';
import 'package:neon/src/settings/models/options_collection.dart';
import 'package:neon/src/settings/utils/settings_export_helper.dart';
import 'package:neon/src/utils/account_options.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/test.dart';

// ignore: missing_override_of_must_be_overridden, avoid_implementing_value_types
class FakeAppImplementation extends Mock implements ClientImplementation {}

class NextcloudAppOptionsMock extends Mock implements NextcloudClientOptions {}

class AccountsBlocMock extends Mock implements AccountsBloc {}

// ignore: avoid_implementing_value_types
class FakeAccount extends Mock implements Account {}

class AccountSpecificOptionsMock extends Mock implements AccountSpecificOptions {}

class ExporterMock extends Mock implements Exportable {}

void main() {
  group('Exporter', () {
    test('AccountsBlocExporter', () {
      var exporter = const ClientImplementationsExporter([]);

      var export = exporter.export();
      expect(Map.fromEntries([export]), {'app': <String, dynamic>{}});

      final fakeApp = FakeAppImplementation();
      final fakeOptions = NextcloudAppOptionsMock();
      exporter = ClientImplementationsExporter([fakeApp]);

      const appValue = MapEntry('appID', 'value');
      const appExport = {
        'app': {'appID': 'value'},
      };

      when(() => fakeApp.options).thenReturn(fakeOptions);
      when(fakeOptions.export).thenReturn(appValue);
      when(() => fakeApp.id).thenReturn('appID');

      export = exporter.export();
      expect(Map.fromEntries([export]), appExport);

      exporter.import(Map.fromEntries([export]));
      verify(() => fakeOptions.import(Map.fromEntries([appValue]))).called(1);
    });

    test('AccountsBlocExporter', () {
      final bloc = AccountsBlocMock();
      final exporter = AccountsBlocExporter(bloc);

      const accountValue = MapEntry('accountID', 'value');
      const accountExport = {
        'accounts': {'accountID': 'value'},
      };

      when(() => bloc.accounts).thenAnswer((final _) => BehaviorSubject.seeded([]));
      var export = exporter.export();
      expect(Map.fromEntries([export]), {'accounts': <String, dynamic>{}});

      final fakeAccount = FakeAccount();
      final fakeOptions = AccountSpecificOptionsMock();
      when(() => bloc.accounts).thenAnswer((final _) => BehaviorSubject.seeded([fakeAccount]));
      when(() => bloc.getOptionsFor(fakeAccount)).thenReturn(fakeOptions);
      when(fakeOptions.export).thenReturn(accountValue);
      when(() => fakeAccount.id).thenReturn('accountID');

      export = exporter.export();
      expect(Map.fromEntries([export]), accountExport);

      exporter.import(Map.fromEntries([export]));
      verify(() => fakeOptions.import(Map.fromEntries([accountValue]))).called(1);
    });
  });

  group('SettingsExportHelper', () {
    test('SettingsExportHelper.json', () async {
      final exportable = ExporterMock();
      final settingsExporter = SettingsExportHelper(
        exportables: {
          exportable,
        },
      );

      const value = MapEntry('exportableKey', 'value');
      const export = {'exportableKey': 'value'};

      when(exportable.export).thenAnswer((final _) => value);

      expect(settingsExporter.exportToJson(), equals(export));

      await settingsExporter.applyFromJson(export);
      verify(() => exportable.import(Map.fromEntries([value]))).called(1);
    });

    test('SettingsExportHelper.file', () async {
      final exportable = ExporterMock();
      final settingsExporter = SettingsExportHelper(
        exportables: {
          exportable,
        },
      );

      const value = MapEntry('exportableKey', 'value');
      const jsonExport = {'exportableKey': 'value'};
      final export = JsonUtf8Encoder().convert(jsonExport) as Uint8List;

      when(exportable.export).thenAnswer((final _) => value);

      expect(settingsExporter.exportToFile(), equals(export));

      await settingsExporter.applyFromFile(_streamValue(export));
      verify(() => exportable.import(Map.fromEntries([value]))).called(1);
    });
  });
}

Stream<T> _streamValue<T>(final T value) async* {
  yield value;
}

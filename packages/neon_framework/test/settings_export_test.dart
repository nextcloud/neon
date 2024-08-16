import 'dart:convert';
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/settings/utils/settings_export_helper.dart';
import 'package:neon_framework/testing.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  group('Exporter', () {
    test('AccountsBlocExporter', () {
      var exporter = AppImplementationsExporter(BuiltSet());

      var export = exporter.export();
      expect(Map.fromEntries([export]), {'app': <String, dynamic>{}});

      final fakeApp = MockAppImplementation();
      final fakeOptions = MockAppImplementationOptions();
      exporter = AppImplementationsExporter(BuiltSet({fakeApp}));

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
      final bloc = MockAccountsBloc();
      final exporter = AccountsBlocExporter(bloc);

      final account = MockAccount();

      final accountValue = MapEntry(account.id, 'value');
      final accountExport = {
        'accounts': {account.id: 'value'},
      };

      when(() => bloc.accounts).thenAnswer((_) => BehaviorSubject.seeded(BuiltList()));
      var export = exporter.export();
      expect(Map.fromEntries([export]), {'accounts': <String, dynamic>{}});

      final fakeOptions = MockAccountOptions();
      when(() => bloc.accounts).thenAnswer((_) => BehaviorSubject.seeded(BuiltList([account])));
      when(() => bloc.getOptionsFor(account)).thenReturn(fakeOptions);
      when(fakeOptions.export).thenReturn(accountValue);

      export = exporter.export();
      expect(Map.fromEntries([export]), accountExport);

      exporter.import(Map.fromEntries([export]));
      verify(() => fakeOptions.import(Map.fromEntries([accountValue]))).called(1);
    });
  });

  group('SettingsExportHelper', () {
    test('SettingsExportHelper.json', () async {
      final exportable = MockExporter();
      final settingsExporter = SettingsExportHelper(
        exportables: {
          exportable,
        },
      );

      const value = MapEntry('exportableKey', 'value');
      const export = {'exportableKey': 'value'};

      when(exportable.export).thenAnswer((_) => value);

      expect(settingsExporter.exportToJson(), equals(export));

      await settingsExporter.applyFromJson(export);
      verify(() => exportable.import(Map.fromEntries([value]))).called(1);
    });

    test('SettingsExportHelper.file', () async {
      final exportable = MockExporter();
      final settingsExporter = SettingsExportHelper(
        exportables: {
          exportable,
        },
      );

      const value = MapEntry('exportableKey', 'value');
      const jsonExport = {'exportableKey': 'value'};
      final export = JsonUtf8Encoder().convert(jsonExport) as Uint8List;

      when(exportable.export).thenAnswer((_) => value);

      expect(settingsExporter.exportToFile(), equals(export));

      await settingsExporter.applyFromFile(_streamValue(export));
      verify(() => exportable.import(Map.fromEntries([value]))).called(1);
    });
  });
}

Stream<T> _streamValue<T>(T value) async* {
  yield value;
}

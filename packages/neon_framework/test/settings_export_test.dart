import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/settings/utils/settings_export_helper.dart';
import 'package:neon_framework/testing.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  group('Exporter', () {
    test('AccountsBlocExporter', () {
      var exporter = const AppImplementationsExporter([]);

      var export = exporter.export();
      expect(Map.fromEntries([export]), {'app': <String, dynamic>{}});

      final fakeApp = AppImplementationMock();
      final fakeOptions = AppImplementationOptionsMock();
      exporter = AppImplementationsExporter([fakeApp]);

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

      when(() => bloc.accounts).thenAnswer((_) => BehaviorSubject.seeded([]));
      var export = exporter.export();
      expect(Map.fromEntries([export]), {'accounts': <String, dynamic>{}});

      final fakeAccount = AccountMock();
      final fakeOptions = AccountOptionsMock();
      when(() => bloc.accounts).thenAnswer((_) => BehaviorSubject.seeded([fakeAccount]));
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

      when(exportable.export).thenAnswer((_) => value);

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

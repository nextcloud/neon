import 'dart:io';

import 'package:nextcloud/nextcloud.dart';
import 'package:path/path.dart' as p;

void main() {
  final constPattern = RegExp(r'\sconst ([A-Z_]+) = ([^;]+);');
  for (final (id, paths) in [
    (
      'core',
      {
        'nextcloud-server/lib/public': [
          'Accounts/IAccountManager.php',
          'Activity/IExtension.php',
          'AppFramework/Http.php',
          'AppFramework/Http/Attribute/OpenAPI.php',
          'AppFramework/Http/TemplateResponse.php',
          'AppFramework/OCSController.php',
          'BackgroundJob/IJob.php',
          'Calendar/ICalendarQuery.php',
          'Calendar/Resource/IResourceMetadata.php',
          'Calendar/Room/IRoomMetadata.php',
          'DB/Exception.php',
          'DB/QueryBuilder/IQueryBuilder.php',
          'Files/Cache/IScanner.php',
          'Files/Cache/IWatcher.php',
          'Files/FileInfo.php',
          'Files/Lock/ILock.php',
          'Files/Search/ISearchBinaryOperator.php',
          'Files/Search/ISearchComparison.php',
          'Files/Search/ISearchOrder.php',
          'Files/Storage/INotifyStorage.php',
          'Files/StorageNotAvailableException.php',
          'FilesMetadata/IFilesMetadataManager.php',
          'FilesMetadata/Model/IMetadataValueWrapper.php',
          'FullTextSearch/Model/IIndex.php',
          'FullTextSearch/Model/IRunner.php',
          'FullTextSearch/Model/ISearchRequestSimpleQuery.php',
          'GroupInterface.php',
          'Http/Client/IPromise.php',
          'IDBConnection.php',
          'INavigationManager.php',
          'IPreview.php',
          'IRequest.php',
          'Lock/ILockingProvider.php',
          'Mail/Headers/AutoSubmitted.php',
          'Profile/IProfileManager.php',
          'Search/FilterDefinition.php',
          'Search/IFilter.php',
          'Security/Bruteforce/IThrottler.php',
          'Security/ISecureRandom.php',
          'Security/VerificationToken/InvalidTokenException.php',
          'Settings/IManager.php',
          'SystemTag/ISystemTag.php',
          'UserStatus/IUserStatus.php',
          'WorkflowEngine/IManager.php',
        ],
      },
    ),
    (
      'spreed',
      {
        'nextcloud-spreed/lib': [],
      }
    )
  ]) {
    for (final path in paths.entries) {
      print(path.key);

      final ignores = path.value.map((p) => '../../external/${path.key}/$p').toList();

      final dir = Directory('../../external/${path.key}');
      final files = dir
          .listSync(recursive: true)
          .whereType<File>()
          .where(
            (file) =>
                file.path.endsWith('.php') &&
                !file.path.contains('/vendor/') &&
                !file.path.endsWith('Event.php') &&
                !file.path.endsWith('Test.php'),
          )
          .toList();

      final out = StringBuffer('// ignore_for_file: public_member_api_docs, constant_identifier_names');

      for (final file in files) {
        final values = <String, Map<String, String>>{};

        for (final match in constPattern.allMatches(file.readAsStringSync())) {
          final value = match.group(2)!;
          if (value.contains('::')) {
            continue;
          }

          final parts = match.group(1)!.split('_');
          if (parts.length < 2) {
            continue;
          }

          values[parts[0]] ??= <String, String>{};
          values[parts[0]]![parts.sublist(1).join('_')] = value;
        }

        values.removeWhere((key, value) => value.length < 2);
        if (values.isEmpty) {
          continue;
        }

        if (ignores.contains(file.path)) {
          ignores.remove(file.path);
          continue;
        }

        print('${p.relative(file.path, from: dir.path)} $values');
        final prefix = PathUri.parse(file.path)
            .name
            .replaceFirst(RegExp(r'(Service|Provider)?.php$'), '')
            .replaceFirstMapped(RegExp('^I([A-Z])'), (match) => match.group(1)!);

        for (final entry in values.entries) {
          String? type;

          final firstValue = entry.value.entries.toList()[0].value;
          if (RegExp(r'^(-)?[0-9]+$').hasMatch(firstValue)) {
            type = 'int';
          } else if (RegExp(r"^'.*'$").hasMatch(firstValue)) {
            type = 'String';
          }

          if (type == null) {
            throw Exception('Could not guess type for $entry');
          }

          out.writeAll(
            [
              '',
              'enum $prefix${entry.key} {',
              '${entry.value.entries.map((entry) => '  ${entry.key.toLowerCase()}(${entry.value})').join(',\n')};',
              '',
              '  const $prefix${entry.key}(this.value);',
              '  final $type value;',
              '}',
              '',
            ],
            '\n',
          );
        }
      }

      File('lib/src/enums/$id.dart').writeAsStringSync(out.toString());

      if (ignores.isNotEmpty) {
        throw Exception('Unused ignores: $ignores');
      }
    }
  }
}

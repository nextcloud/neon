import 'package:built_value_test/matcher.dart';
import 'package:nextcloud/notifications.dart';
import 'package:test/test.dart';

void main() {
  test('generatePushTokenHash', () {
    expect(
      generatePushTokenHash('789'),
      equals(
        'ca9879bd727ba3bd815f05fe6b9e4640c774b61cc8f141295542cefc1b7b8fc6e3daf3f656555cdec355894e7af48964e88994d960f41ba8f61f7a05d5ddbd07',
      ),
    );
  });

  group('DecryptedSubject', () {
    DecryptedSubject createDecryptedSubject({
      int? nid = 1,
      String? app = 'app',
      String? subject = 'subject',
      String? type = 'type',
      String? id = 'id',
      bool? delete = false,
      bool? deleteAll = false,
    }) {
      return DecryptedSubject((b) {
        b
          ..nid = nid
          ..app = app
          ..subject = subject
          ..type = type
          ..id = id
          ..delete = delete
          ..deleteAll = deleteAll;
      });
    }

    group('constructor', () {
      test('works correctly', () {
        expect(
          createDecryptedSubject,
          returnsNormally,
        );
      });
    });

    test('supports value equality', () {
      expect(
        createDecryptedSubject(),
        equalsBuilt(createDecryptedSubject()),
      );

      expect(
        createDecryptedSubject().hashCode,
        equals(createDecryptedSubject().hashCode),
      );

      expect(
        createDecryptedSubject(),
        isNot(equalsBuilt(createDecryptedSubject(deleteAll: true))),
      );
    });

    group('rebuild', () {
      test('returns the same object if not attributes are changed', () {
        expect(
          createDecryptedSubject().rebuild((_) {}),
          equalsBuilt(createDecryptedSubject()),
        );
      });

      test('replaces every attribute', () {
        expect(
          createDecryptedSubject().rebuild((b) {
            b
              ..nid = 2
              ..app = 'new-app'
              ..subject = 'new-subject'
              ..type = 'new-type'
              ..id = 'new-id'
              ..delete = true
              ..deleteAll = true;
          }),
          equalsBuilt(
            createDecryptedSubject(
              nid: 2,
              app: 'new-app',
              subject: 'new-subject',
              type: 'new-type',
              id: 'new-id',
              delete: true,
              deleteAll: true,
            ),
          ),
        );
      });
    });

    group('serialization', () {
      test('fromJson works correctly', () {
        expect(
          DecryptedSubject.fromJson({
            'nid': 1,
            'app': 'app',
            'subject': 'subject',
            'type': 'type',
            'id': 'id',
            'delete': false,
            'delete-all': false,
          }),
          equalsBuilt(createDecryptedSubject()),
        );
      });

      test('toJson works correctly', () {
        expect(
          createDecryptedSubject().toJson(),
          equals({
            'nid': 1,
            'app': 'app',
            'subject': 'subject',
            'type': 'type',
            'id': 'id',
            'delete': false,
            'delete-all': false,
          }),
        );
      });
    });

    test('to string', () {
      expect(
        createDecryptedSubject().toString(),
        equals('''
DecryptedSubject {
  nid=1,
  app=app,
  subject=subject,
  type=type,
  id=id,
  delete=false,
  deleteAll=false,
}'''),
      );
    });
  });
}

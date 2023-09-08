import 'package:dynamite_end_to_end_test/date_time.openapi.dart';
import 'package:test/test.dart';

void main() {
  test(r'$DateTime', () {
    final object = $DateTime(
      (final b) => b
        ..date = DateTime(2023, 10, 23).toUtc()
        ..dateTime = DateTime(2023, 10, 23, 16, 45, 20).toUtc(),
    );

    final json = {
      'date': '2023-10-22T22:00:00.000Z',
      'date-time': '2023-10-23T14:45:20.000Z',
    };

    expect(object.toJson(), equals(json));
    expect($DateTime.fromJson(json), equals(object));
  });
}

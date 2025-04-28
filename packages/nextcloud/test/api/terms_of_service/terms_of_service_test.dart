import 'package:nextcloud/terms_of_service.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

void main() {
  presets('terms_of_service', 'terms_of_service', username: 'admin', (tester) {
    group('terms', () {
      test('getAdminFormData', () async {
        final response = await tester.client.termsOfService.terms.getAdminFormData();
        expect(response.body.ocs.data.terms, isEmpty);
        expect(response.body.ocs.data.countries, hasLength(250));
        expect(response.body.ocs.data.languages, hasLength(184));
        expect(response.body.ocs.data.tosOnPublicShares, AdminFormData_TosOnPublicShares.$0);
        expect(response.body.ocs.data.tosForUsers, AdminFormData_TosForUsers.$1);
      });

      test('create', () async {
        final createResponse = await tester.client.termsOfService.terms.create(
          $body: TermsCreateRequestApplicationJson(
            (b) => b
              ..countryCode = 'DE'
              ..languageCode = 'de'
              ..body = 'test',
          ),
        );
        expect(createResponse.body.ocs.data.id, isPositive);
        expect(createResponse.body.ocs.data.countryCode, 'DE');
        expect(createResponse.body.ocs.data.languageCode, 'de');
        expect(createResponse.body.ocs.data.body, 'test');
        expect(createResponse.body.ocs.data.renderedBody, '<p>test</p>');

        final formDataResponse = await tester.client.termsOfService.terms.getAdminFormData();
        expect(
          formDataResponse.body.ocs.data.terms[createResponse.body.ocs.data.id.toString()],
          createResponse.body.ocs.data,
        );
      });

      test('destroy', () async {
        final createResponse = await tester.client.termsOfService.terms.create(
          $body: TermsCreateRequestApplicationJson(
            (b) => b
              ..countryCode = 'DE'
              ..languageCode = 'de'
              ..body = 'test',
          ),
        );

        var formDataResponse = await tester.client.termsOfService.terms.getAdminFormData();
        expect(
          formDataResponse.body.ocs.data.terms[createResponse.body.ocs.data.id.toString()],
          createResponse.body.ocs.data,
        );

        await tester.client.termsOfService.terms.destroy(
          id: createResponse.body.ocs.data.id,
        );

        formDataResponse = await tester.client.termsOfService.terms.getAdminFormData();
        expect(formDataResponse.body.ocs.data.terms[createResponse.body.ocs.data.id.toString()], isNull);
      });

      test('index', () async {
        final indexResponse = await tester.client.termsOfService.terms.index();
        expect(indexResponse.body.ocs.data.terms, isEmpty);
        expect(indexResponse.body.ocs.data.languages, hasLength(184));
        expect(indexResponse.body.ocs.data.hasSigned, isTrue);
      });
    });

    group('signing', () {
      test('signTermsPublic', () async {
        final createResponse = await tester.client.termsOfService.terms.create(
          $body: TermsCreateRequestApplicationJson(
            (b) => b
              ..countryCode = 'DE'
              ..languageCode = 'de'
              ..body = 'test',
          ),
        );

        await tester.client.termsOfService.signing.signTermsPublic(
          $body: SigningSignTermsPublicRequestApplicationJson(
            (b) => b..termId = createResponse.body.ocs.data.id,
          ),
        );
      });

      test('signTerms', () async {
        final createResponse = await tester.client.termsOfService.terms.create(
          $body: TermsCreateRequestApplicationJson(
            (b) => b
              ..countryCode = 'DE'
              ..languageCode = 'de'
              ..body = 'test',
          ),
        );

        await tester.client.termsOfService.signing.signTerms(
          $body: SigningSignTermsRequestApplicationJson(
            (b) => b..termId = createResponse.body.ocs.data.id,
          ),
        );
      });

      test('resetAllSignatories', () async {
        await tester.client.termsOfService.signing.resetAllSignatories();
      });
    });
  });
}

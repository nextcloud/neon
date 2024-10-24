import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
// ignore: implementation_imports
import 'package:matcher/src/expect/async_matcher.dart';
import 'package:nextcloud/webdav.dart';
import 'package:nextcloud_test/src/models/models.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

class _ContainsAllAvailableProps extends AsyncMatcher {
  _ContainsAllAvailableProps(
    this.tester,
    this.uri,
  );

  final NextcloudTester tester;
  final PathUri uri;

  @override
  Description describe(Description description) {
    return description;
  }

  @override
  Future<String?> matchAsync(dynamic item) async {
    if (item is! XmlElement) {
      return 'Expected XmlElement, got ${item.runtimeType}.';
    }

    final parsedProps = _getMultistatusPropNames(item);
    if (parsedProps.isEmpty) {
      return 'Parsed props were empty';
    }

    final streamedResponse = await tester.client.webdav.httpClient.send(tester.client.webdav.propfind_Request(uri));
    if (streamedResponse.statusCode != 207) {
      return 'PROPFIND response status code was not 207';
    }
    final rawResponse = await http.Response.fromStream(streamedResponse);

    final expectedProps = _getMultistatusPropNames(XmlDocument.parse(rawResponse.body).rootElement);
    if (expectedProps.isEmpty) {
      return 'Expected props were empty';
    }

    if (parsedProps != expectedProps) {
      return 'Missing props: ${expectedProps.where((p) => !parsedProps.contains(p)).join(', ')}';
    }

    return null;
  }

  BuiltList<String> _getMultistatusPropNames(XmlElement root) {
    return root.firstElementChild!.childElements
        .singleWhere(
          (node) =>
              node.name.local == 'propstat' &&
              node.childElements.singleWhere((node) => node.name.local == 'status').innerText.contains('200 OK'),
        )
        .childElements
        .singleWhere((node) => node.name.local == 'prop')
        .childElements
        .map((el) => '{${el.name.namespaceUri}}${el.name.local}')
        .toList()
        .sorted()
        .toBuiltList();
  }
}

/// Checks that all props have been parsed, by comparing them to a raw PROPFIND response of a request to [uri].
Matcher containsAllAvailableProps(NextcloudTester tester, PathUri uri) => _ContainsAllAvailableProps(tester, uri);

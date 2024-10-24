import 'package:nextcloud/src/api/webdav/models/models.dart';
import 'package:nextcloud/src/api/webdav/utils/utils.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('props', () {
    expect(
      const WebDavResponse(
        href: null,
        propstats: [
          WebDavPropstat(
            status: 'HTTP/1.1 404 Not Found',
            prop: WebDavProp(ocSize: 1),
          ),
          WebDavPropstat(
            status: 'HTTP/1.1 200 OK',
            prop: WebDavProp(ocSize: 2),
          ),
        ],
      ).props.ocSize,
      2,
    );
  });

  group('path', () {
    group('Root', () {
      test('File', () {
        expect(
          const WebDavResponse(
            href: '/remote.php/webdav/abc/def.txt',
            propstats: [],
          ).path,
          PathUri.parse('abc/def.txt'),
        );
      });

      test('Directory', () {
        expect(
          const WebDavResponse(
            href: '/remote.php/webdav/abc/def/',
            propstats: [],
          ).path,
          PathUri.parse('abc/def/'),
        );
      });
    });

    group('Subpath', () {
      test('File', () {
        expect(
          const WebDavResponse(
            href: '/subpath/remote.php/webdav/abc/def.txt',
            propstats: [],
          ).path,
          PathUri.parse('abc/def.txt'),
        );
      });

      test('Directory', () {
        expect(
          const WebDavResponse(
            href: '/subpath/remote.php/webdav/abc/def/',
            propstats: [],
          ).path,
          PathUri.parse('abc/def/'),
        );
      });
    });
  });

  group('name', () {
    test('File', () {
      expect(
        const WebDavResponse(
          href: '/remote.php/webdav/abc/def.txt',
          propstats: [],
        ).name,
        'def.txt',
      );
    });

    test('Directory', () {
      expect(
        const WebDavResponse(
          href: '/remote.php/webdav/abc/def/',
          propstats: [],
        ).name,
        'def',
      );
    });
  });

  group('isHidden', () {
    group('From prop', () {
      test('File', () {
        expect(
          const WebDavResponse(
            href: '/remote.php/webdav/abc/def.txt',
            propstats: [
              WebDavPropstat(
                status: 'HTTP/1.1 200 OK',
                prop: WebDavProp(
                  ncHidden: true,
                ),
              ),
            ],
          ).isHidden,
          true,
        );
      });

      test('Directory', () {
        expect(
          const WebDavResponse(
            href: '/remote.php/webdav/abc/def/',
            propstats: [
              WebDavPropstat(
                status: 'HTTP/1.1 200 OK',
                prop: WebDavProp(
                  ncHidden: true,
                ),
              ),
            ],
          ).isHidden,
          true,
        );
      });
    });

    group('From path', () {
      test('File', () {
        expect(
          const WebDavResponse(
            href: '/remote.php/webdav/abc/.def.txt',
            propstats: [
              WebDavPropstat(
                status: 'HTTP/1.1 200 OK',
                prop: WebDavProp(),
              ),
            ],
          ).isHidden,
          true,
        );
      });

      test('Directory', () {
        expect(
          const WebDavResponse(
            href: '/remote.php/webdav/abc/.def/',
            propstats: [
              WebDavPropstat(
                status: 'HTTP/1.1 200 OK',
                prop: WebDavProp(),
              ),
            ],
          ).isHidden,
          true,
        );
      });
    });
  });

  group('isDirectory', () {
    group('From prop', () {
      test('File', () {
        expect(
          const WebDavResponse(
            href: '/remote.php/webdav/abc/def.txt',
            propstats: [
              WebDavPropstat(
                status: 'HTTP/1.1 200 OK',
                prop: WebDavProp(
                  davResourcetype: WebDavResourcetype(
                    collection: null,
                  ),
                ),
              ),
            ],
          ).isDirectory,
          false,
        );
      });

      test('Directory', () {
        expect(
          const WebDavResponse(
            href: '/remote.php/webdav/abc/def/',
            propstats: [
              WebDavPropstat(
                status: 'HTTP/1.1 200 OK',
                prop: WebDavProp(
                  davResourcetype: WebDavResourcetype(
                    collection: [],
                  ),
                ),
              ),
            ],
          ).isDirectory,
          true,
        );
      });
    });

    group('From path', () {
      test('File', () {
        expect(
          const WebDavResponse(
            href: '/remote.php/webdav/abc/def.txt',
            propstats: [
              WebDavPropstat(
                status: 'HTTP/1.1 200 OK',
                prop: WebDavProp(),
              ),
            ],
          ).isDirectory,
          false,
        );
      });

      test('Directory', () {
        expect(
          const WebDavResponse(
            href: '/remote.php/webdav/abc/def/',
            propstats: [
              WebDavPropstat(
                status: 'HTTP/1.1 200 OK',
                prop: WebDavProp(),
              ),
            ],
          ).isDirectory,
          true,
        );
      });
    });
  });
}

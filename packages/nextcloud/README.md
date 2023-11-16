# nextcloud

A Nextcloud API client written in Dart.

## Installation

In the future this code will be available at https://pub.dev/packages/nextcloud, but for now you have to include it via git in your pubspec.yaml:
```yaml
dependencies:
  nextcloud:
    git:
      url: https://github.com/nextcloud/neon
      path: packages/nextcloud
      ref: $COMMIT

dependency_overrides:
  dynamite_runtime:
    git:
      url: https://github.com/nextcloud/neon
      path: packages/dynamite/dynamite_runtime
      ref: $COMMIT
```
You can either remove the `ref` or use a commit hash. It's not recommended to remove it, because then the version will be updated very often.

## Development

Except for WebDAV all client code is generated using OpenAPI specifications which can be found in the `lib/src/api/` folder.  
These OpenAPI specifications are [generated](https://github.com/nextcloud/openapi-extractor) from the PHP source code.

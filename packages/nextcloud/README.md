# nextcloud

A Nextcloud client written in Dart.  

This client will become the replacement for https://github.com/provokateurin/dart-nextcloud at some point ([See](https://github.com/provokateurin/nextcloud-neon/issues/1)).


## Installing

In the future this code will be available at https://pub.dev/packages/nextcloud, but for now you have to include it via git in your pubspec.yaml:
```yaml
dependencies:
  nextcloud:
    git:
      url: https://github.com/provokateurin/nextcloud-neon
      path: packages/nextcloud
      ref: $COMMIT

dependency_overrides:
  dynamite_runtime:
    git:
      url: https://github.com/provokateurin/nextcloud-neon
      path: packages/dynamite/dynamite_runtime
      ref: $COMMIT
```
You can either remove the `ref` or use a commit hash. It's not recommended to remove it, because then the version will be updated very often.

## Development

Except for WebDAV all client code is generated using OpenAPI specs which can be found in the `../../specs/` folder.  
Templates for these OpenAPI specs are generated from the Nextcloud codebase to make development easier.  

To generate such a template take a look at `../../tool/generate-nextcloud.sh`.  
After you have generated a template, you need to fill it out. Some endpoints can or have to be discarded.  

Then you start writing tests for the endpoints you added.  
To easily inspect the responses for an endpoint, just set the `type` to `string` inside the `schema` blocks of the spec and let the output be printed in the tests.

Sometimes you will have to look at the source code of Nextcloud, because the API is not always intuitive. Make sure to check if there is any API documentation that can help you.

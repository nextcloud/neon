# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2024-04-25

### Changes

---

Packages with breaking changes:

 - [`dynamite` - `v0.3.0`](#dynamite---v030)
 - [`dynamite_runtime` - `v0.3.0`](#dynamite_runtime---v030)
 - [`nextcloud` - `v6.0.0`](#nextcloud---v600)

Packages with other changes:

 - There are no other changes in this release.

---

#### `dynamite` - `v0.3.0`

 - **REFACTOR**(dynamite): externalize url path generation. ([c42e100c](https://github.com/nextcloud/neon/commit/c42e100cf307f8a456c98ff0df5dfc5d71c0db25))
 - **REFACTOR**(dynamite): use logger to display warnings. ([4fb4ce3a](https://github.com/nextcloud/neon/commit/4fb4ce3a14d993ace352e8ca3374bb12d6b5475f))
 - **REFACTOR**: Stop using spread list operator. ([bb8a2965](https://github.com/nextcloud/neon/commit/bb8a29651b371166131e8254afa36550802c8f8a))
 - **REFACTOR**(dynamite): deduplicate object interface generation. ([13f783cf](https://github.com/nextcloud/neon/commit/13f783cf8a3f08e5e29f8f43cbf7f98784753440))
 - **REFACTOR**(dynamite): unify allOf and object generation. ([fb84f5a6](https://github.com/nextcloud/neon/commit/fb84f5a6574678490b732115cd8d338c75233282))
 - **REFACTOR**(dynamite): move defaults and validation methods to the interface. ([f2c6a174](https://github.com/nextcloud/neon/commit/f2c6a174f7b42ead486ad5f2c941bfe1e526f222))
 - **REFACTOR**(dynamite): directly write to the code body StringBuffer. ([ea9e05cb](https://github.com/nextcloud/neon/commit/ea9e05cbc17716c3599c69570272ba7bb42706b0))
 - **REFACTOR**(dynamite): prefer using allocator over an emitter. ([61fa838b](https://github.com/nextcloud/neon/commit/61fa838bfdfd1cf601b250a62d5d3e28b5bc303b))
 - **REFACTOR**(dynamite): externalize response type resolving. ([a16cc4b1](https://github.com/nextcloud/neon/commit/a16cc4b176cbb4135113a2cddcc6ff2d389793f9))
 - **REFACTOR**(dynamite): split mimetype resolving and parameter generation. ([db32d953](https://github.com/nextcloud/neon/commit/db32d953e987d619457e91555d1a61d3ed39599b))
 - **REFACTOR**(dynamite): split parameter resolving and generation. ([c68be1d0](https://github.com/nextcloud/neon/commit/c68be1d071dbd71838a786d9b39cd00a82829419))
 - **REFACTOR**(dynamite): prefer using TypeReference over emitter. ([afdb0841](https://github.com/nextcloud/neon/commit/afdb0841a3935e35d1d3eb2d8dcbe069d5e80856))
 - **REFACTOR**(dynamite_runtime): rework DynamiteRawResponse. ([e7f2f351](https://github.com/nextcloud/neon/commit/e7f2f351057f90ab83d18af63684b7c50e617855))
 - **PERF**(dynamite): use memoization for for better performance. ([b25c4089](https://github.com/nextcloud/neon/commit/b25c408935c537e9d590080b34f1194ed8ac319b))
 - **FIX**(dynamite): json schema reference resolving. ([a3c55c16](https://github.com/nextcloud/neon/commit/a3c55c16a3f84793b39e53c24d6191ea6d092a4e))
 - **FIX**(dynamite): append `_test` to test file names. ([3e661503](https://github.com/nextcloud/neon/commit/3e6615037c74fe9f6d18379c61addcea2cca46b4))
 - **FIX**(dynamite): always require content for a request body. ([a5388620](https://github.com/nextcloud/neon/commit/a5388620eb55db4d62525e12cc8616af0cbeb896))
 - **FIX**(dynamite): inherrit _defaults and _validate hooks in allOf. ([af959dbf](https://github.com/nextcloud/neon/commit/af959dbf7c6cd495124adbe5ca0fa3670ffea54a))
 - **FIX**(dynamite): allow boolean values for Schema.additionalProperties. ([3266d742](https://github.com/nextcloud/neon/commit/3266d742c221d63e14db4e6abee06c278383161b))
 - **FIX**(dynamite): recursively use  for generic in TypeResult.dartType. ([fb14a15d](https://github.com/nextcloud/neon/commit/fb14a15d8aa373f2117b881ff6382cee312028eb))
 - **FIX**(dynamite): more resilient doc comment generation. ([e09495f8](https://github.com/nextcloud/neon/commit/e09495f82916a17ddf827441427f6c8b718799c3))
 - **FIX**(dynamite): build config to allow built_value_generator running inside dynamite. ([83e66243](https://github.com/nextcloud/neon/commit/83e6624378c79d534e6e3440721e48e7a9e518f7))
 - **FIX**(dynamite): only allow a single contenttype for parameters. ([e7b503dd](https://github.com/nextcloud/neon/commit/e7b503dd1c0a88c5b95a853d6f43a46e9fdc97e1))
 - **FEAT**(dynamite_runtime): add dynamite serializer. ([187e0cee](https://github.com/nextcloud/neon/commit/187e0cee717cfdd917c302a5b536fb65a55073d8))
 - **FEAT**(dynamite_runtime): use http.Request in generated code. ([c9d0b243](https://github.com/nextcloud/neon/commit/c9d0b243accd8d70601260797c5168f09ef61ee7))
 - **FEAT**(dynamite): Remove need for double fix and format. ([3f159419](https://github.com/nextcloud/neon/commit/3f159419e43e547bdd47d2158604c441982977a6))
 - **FEAT**(dynamite): allow escaping reserved method names. ([aa19a9a4](https://github.com/nextcloud/neon/commit/aa19a9a444aca6798075d3d2f70d573abc6babaa))
 - **BREAKING** **REFACTOR**(dynamite,dynamite_runtime): Always send cookies for all requests. ([e37b7753](https://github.com/nextcloud/neon/commit/e37b775314601e9281d7336939e4b1eb95b98b55))
 - **BREAKING** **REFACTOR**(dynamite_runtime): Remove executeRequest and executeRawRequest methods. ([eb9e018c](https://github.com/nextcloud/neon/commit/eb9e018c8b12135537268b22566e1eb9518541ed))
 - **BREAKING** **REFACTOR**(dynamite_runtime): validate status code in the dynamite serializer. ([bc6f7d9f](https://github.com/nextcloud/neon/commit/bc6f7d9fb622ee803a2f8df203e43bdae890d5f7))
 - **BREAKING** **REFACTOR**(dynamite,dynamite_runtime,nextcloud): generated clients no longer implement http.Client. ([392e18fa](https://github.com/nextcloud/neon/commit/392e18faa6bb1ba72f22a56184ba0c43ef6b28d4))
 - **BREAKING** **FIX**(dynamite): Use maxItems instead of maxLength to optimize arrays. ([57d8df40](https://github.com/nextcloud/neon/commit/57d8df4046b2661f850fa4a15dc5f89c313bbfb8))
 - **BREAKING** **FIX**(dynamite,nextcloud): escape http methods as reserved method names. ([48233c58](https://github.com/nextcloud/neon/commit/48233c58638da047ca1a6216ecc44d7dd363f77e))
 - **BREAKING** **FEAT**(dynamite): Show field names in oneOf/anyOf validation errors. ([9d236ebc](https://github.com/nextcloud/neon/commit/9d236ebce59da3b9c0e85f2765df36a0ab9f6445))

#### `dynamite_runtime` - `v0.3.0`

 - **REFACTOR**(dynamite_runtime): rework DynamiteRawResponse. ([e7f2f351](https://github.com/nextcloud/neon/commit/e7f2f351057f90ab83d18af63684b7c50e617855))
 - **REFACTOR**(dynamite_runtime): split dynamite_client into separate libraries. ([74b0588c](https://github.com/nextcloud/neon/commit/74b0588ca4d644cf01665d121ca02b662bb03bea))
 - **FIX**(dynamite_runtime): Fix minLength/maxLength error messages. ([fa105f95](https://github.com/nextcloud/neon/commit/fa105f9509992c2ae2cc5f65a369fa5f794557c2))
 - **FIX**(dynamite_runtime): Remove duplicate status code from DynamiteStatusCodeException message. ([bba2fb40](https://github.com/nextcloud/neon/commit/bba2fb40d70b7a82f78bb08b1e77af366bb4bb03))
 - **FIX**(dynamite_runtime): cookie header format. ([b6f3965a](https://github.com/nextcloud/neon/commit/b6f3965a1d77d0ef8a60d9b1412fae796c1898cf))
 - **FEAT**(dynamite_runtime): export HttpBytesStreamExtension. ([7ed974c5](https://github.com/nextcloud/neon/commit/7ed974c523dc0df1a614b7ba0bef6d76a8c576fc))
 - **FEAT**(dynamite_runtime): use http.Request in generated code. ([c9d0b243](https://github.com/nextcloud/neon/commit/c9d0b243accd8d70601260797c5168f09ef61ee7))
 - **FEAT**(dynamite_runtime): add dynamite serializer. ([187e0cee](https://github.com/nextcloud/neon/commit/187e0cee717cfdd917c302a5b536fb65a55073d8))
 - **FEAT**(dynamite_runtime): add new internal ByteStream extension based on http.ByteStream. ([f9c58c9e](https://github.com/nextcloud/neon/commit/f9c58c9e01ef4cdeb2cd79532f5482db10941f5d))
 - **FEAT**(dynamite_runtime): make DynamiteClient extend http.Client. ([5db4f891](https://github.com/nextcloud/neon/commit/5db4f891c6699d9967d2acd8ea528b4a0008a2b1))
 - **BREAKING** **REFACTOR**(dynamite_runtime): remove deprecated ByteStreamExtension. ([bf9db973](https://github.com/nextcloud/neon/commit/bf9db973cee3432d73df87f9e8c43495830749f3))
 - **BREAKING** **REFACTOR**(dynamite,dynamite_runtime,nextcloud): generated clients no longer implement http.Client. ([392e18fa](https://github.com/nextcloud/neon/commit/392e18faa6bb1ba72f22a56184ba0c43ef6b28d4))
 - **BREAKING** **REFACTOR**(dynamite_runtime): Remove executeRequest and executeRawRequest methods. ([eb9e018c](https://github.com/nextcloud/neon/commit/eb9e018c8b12135537268b22566e1eb9518541ed))
 - **BREAKING** **REFACTOR**(dynamite,dynamite_runtime): Always send cookies for all requests. ([e37b7753](https://github.com/nextcloud/neon/commit/e37b775314601e9281d7336939e4b1eb95b98b55))
 - **BREAKING** **REFACTOR**(dynamite_runtime): validate status code in the dynamite serializer. ([bc6f7d9f](https://github.com/nextcloud/neon/commit/bc6f7d9fb622ee803a2f8df203e43bdae890d5f7))
 - **BREAKING** **FIX**(dynamite): Use maxItems instead of maxLength to optimize arrays. ([57d8df40](https://github.com/nextcloud/neon/commit/57d8df4046b2661f850fa4a15dc5f89c313bbfb8))
 - **BREAKING** **FEAT**(dynamite): Show field names in oneOf/anyOf validation errors. ([9d236ebc](https://github.com/nextcloud/neon/commit/9d236ebce59da3b9c0e85f2765df36a0ab9f6445))

#### `nextcloud` - `v6.0.0`

 - **REFACTOR**(nextcloud): Sort WebDAV props alphabetically. ([20fb3ab4](https://github.com/nextcloud/neon/commit/20fb3ab4717c0826df1c3cba3be743086acdeaa2))
 - **REFACTOR**(dynamite): move defaults and validation methods to the interface. ([f2c6a174](https://github.com/nextcloud/neon/commit/f2c6a174f7b42ead486ad5f2c941bfe1e526f222))
 - **REFACTOR**(nextcloud): separate webdav utils and models from the webdav/client library. ([2c765aff](https://github.com/nextcloud/neon/commit/2c765aff5e12a14d89f06af110c21a77e379f12d))
 - **REFACTOR**(dynamite): split parameter resolving and generation. ([c68be1d0](https://github.com/nextcloud/neon/commit/c68be1d071dbd71838a786d9b39cd00a82829419))
 - **REFACTOR**(dynamite_runtime): rework DynamiteRawResponse. ([e7f2f351](https://github.com/nextcloud/neon/commit/e7f2f351057f90ab83d18af63684b7c50e617855))
 - **REFACTOR**: Use DateTimeUtils to handle unix epochs. ([a96fe7c7](https://github.com/nextcloud/neon/commit/a96fe7c7ee44cd432a0c0178cc69eea2326d42a1))
 - **REFACTOR**(nextcloud): use package:timezone TZDateTime for dates. ([d1fcfbd6](https://github.com/nextcloud/neon/commit/d1fcfbd6a8bffcb3d771af65da2a94e90b6e632d))
 - **REFACTOR**(nextcloud): add webdav headers to the request. ([972daf0f](https://github.com/nextcloud/neon/commit/972daf0fd27b71f21ba4d33819be6338b733588e))
 - **REFACTOR**(nextcloud): Define generated WebDAV props inside the generation script. ([f7dddf9b](https://github.com/nextcloud/neon/commit/f7dddf9bbe0dcceabed58b8b9126566c264211b1))
 - **REFACTOR**(nextcloud): Generate correctly formatted WebDAV props code. ([59605418](https://github.com/nextcloud/neon/commit/596054180a0b67e97b8988c7d6e7a4aacedf7a56))
 - **FIX**(tool): Run all tests using flutter. ([a590fe2b](https://github.com/nextcloud/neon/commit/a590fe2bc67399fe65b6978a6c82e6bef2f0cbb6))
 - **FIX**(deps): update dependency timezone to ^0.9.3. ([42885c64](https://github.com/nextcloud/neon/commit/42885c647e3ba35d7cac6c8c4705cbe90e6999c6))
 - **FIX**(nextcloud): Send cookies when acquiring CSRF token. ([cc7a71c7](https://github.com/nextcloud/neon/commit/cc7a71c73683aa6373e09c746582764107f6d196))
 - **FIX**: Only use UTC DateTimes. ([4e3e1914](https://github.com/nextcloud/neon/commit/4e3e1914698c10f77381ee4e0548f194cfd39679))
 - **FIX**(dynamite): inherrit _defaults and _validate hooks in allOf. ([af959dbf](https://github.com/nextcloud/neon/commit/af959dbf7c6cd495124adbe5ca0fa3670ffea54a))
 - **FIX**(nextcloud): Add missing share types. ([f03f75f5](https://github.com/nextcloud/neon/commit/f03f75f51744711eaa37d8aa8956bfedf0f09dce))
 - **FIX**(nextcloud): Add missing spreed MessageTypes. ([b86d23ca](https://github.com/nextcloud/neon/commit/b86d23ca36cade4aa57b6e78cb40496b7164d71e))
 - **FEAT**(dynamite_runtime): add dynamite serializer. ([187e0cee](https://github.com/nextcloud/neon/commit/187e0cee717cfdd917c302a5b536fb65a55073d8))
 - **FEAT**(dynamite_runtime): use http.Request in generated code. ([c9d0b243](https://github.com/nextcloud/neon/commit/c9d0b243accd8d70601260797c5168f09ef61ee7))
 - **FEAT**(nextcloud): Support systemtags and user_ldap apps. ([74c469d2](https://github.com/nextcloud/neon/commit/74c469d2536cec1a2730e29c4b6878445a9615ff))
 - **FEAT**(dynamite): Remove need for double fix and format. ([3f159419](https://github.com/nextcloud/neon/commit/3f159419e43e547bdd47d2158604c441982977a6))
 - **FEAT**(nextcloud): add date time utils. ([d85efb34](https://github.com/nextcloud/neon/commit/d85efb3462270184da60bbe6d30473d8b0313715))
 - **FEAT**(neon_lints): enable avoid_print rule. ([e951337d](https://github.com/nextcloud/neon/commit/e951337d9625958d4129f5bb7db681197d6f24b1))
 - **FEAT**(nextcloud): migrate webdav to DynamiteClient.sendWithCookies. ([67a122a6](https://github.com/nextcloud/neon/commit/67a122a6a179da1ba978630c50c8af86f11c22a6))
 - **FEAT**(nextcloud): add http.Client that handles the CSRF token for webdav requests. ([3e259baa](https://github.com/nextcloud/neon/commit/3e259baaa6c67e18070278132f41f0329db5a6c2))
 - **FEAT**(nextcloud): add webdav response converter. ([20ede067](https://github.com/nextcloud/neon/commit/20ede067fd763b1a52e0cffa2c3863ac420e7b7a))
 - **FEAT**(tool,nextcloud): Add drop_account app. ([0b9f502e](https://github.com/nextcloud/neon/commit/0b9f502e654713b74fcbd327f1e1e70b7163251e))
 - **FEAT**(nextcloud): add requests for webdav operations. ([72462154](https://github.com/nextcloud/neon/commit/72462154ca9f8aa5e9819c3eb48ecf25d60d17fd))
 - **FEAT**(nextcloud): add custom http date parser to support rfc822 time zone offsets. ([6ab8f5dd](https://github.com/nextcloud/neon/commit/6ab8f5dd6f719d217fbb018af51838cca907bc81))
 - **FEAT**(nextcloud): Consider WebDAV hidden prop. ([18a98164](https://github.com/nextcloud/neon/commit/18a98164e844e185f33ca192a78966d56ce8fbf2))
 - **FEAT**(nextcloud): Support all WebDAV props. ([add7a8f0](https://github.com/nextcloud/neon/commit/add7a8f0f8d4ec742b4157976cf0e0e9dc461f1f))
 - **FEAT**(dynamite_runtime): make DynamiteClient extend http.Client. ([5db4f891](https://github.com/nextcloud/neon/commit/5db4f891c6699d9967d2acd8ea528b4a0008a2b1))
 - **FEAT**(nextcloud): Support notes 4.10. ([6fe20fc0](https://github.com/nextcloud/neon/commit/6fe20fc0502aefd078f3c2b607235bf513462abf))
 - **FEAT**(dynamite_runtime): add new internal ByteStream extension based on http.ByteStream. ([f9c58c9e](https://github.com/nextcloud/neon/commit/f9c58c9e01ef4cdeb2cd79532f5482db10941f5d))
 - **DOCS**(nextcloud): Add documentation to NextcloudClient. ([9001f126](https://github.com/nextcloud/neon/commit/9001f1264607ac51a04a1c069772b7bc584761f7))
 - **BREAKING** **REFACTOR**(nextcloud): Use camel case for WebDAV props. ([6ff2f0ca](https://github.com/nextcloud/neon/commit/6ff2f0cafb80ba9b6bc236a172faf014eb29e4a5))
 - **BREAKING** **REFACTOR**(nextcloud): do not export deprecated ByteStreamExtension. ([0830c5a3](https://github.com/nextcloud/neon/commit/0830c5a351904f820d203b61b9bca14fe14fadd0))
 - **BREAKING** **REFACTOR**(dynamite,dynamite_runtime): Always send cookies for all requests. ([e37b7753](https://github.com/nextcloud/neon/commit/e37b775314601e9281d7336939e4b1eb95b98b55))
 - **BREAKING** **REFACTOR**(nextcloud): use http_parser for http date parsing. ([5223df77](https://github.com/nextcloud/neon/commit/5223df77ae1254aa74e9ab136fcec151bc3deb4d))
 - **BREAKING** **REFACTOR**(nextcloud): Remove loginName field from client. ([d2a73b49](https://github.com/nextcloud/neon/commit/d2a73b4965d76e9a0f18a34e976e4376c1bb9bb4))
 - **BREAKING** **REFACTOR**(dynamite_runtime): validate status code in the dynamite serializer. ([bc6f7d9f](https://github.com/nextcloud/neon/commit/bc6f7d9fb622ee803a2f8df203e43bdae890d5f7))
 - **BREAKING** **REFACTOR**(nextcloud): Remove AppType and simplify user-agent configuration. ([4edb3753](https://github.com/nextcloud/neon/commit/4edb375317471180a152323be77ad0389ab4df53))
 - **BREAKING** **REFACTOR**(nextcloud): Remove non-working language parameter in NextcloudClient. ([ceb28588](https://github.com/nextcloud/neon/commit/ceb28588d526fc201632050a361e3aad0a65a0b2))
 - **BREAKING** **REFACTOR**(dynamite,dynamite_runtime,nextcloud): generated clients no longer implement http.Client. ([392e18fa](https://github.com/nextcloud/neon/commit/392e18faa6bb1ba72f22a56184ba0c43ef6b28d4))
 - **BREAKING** **REFACTOR**(nextcloud): Patch enums into spreed specification. ([60e549e1](https://github.com/nextcloud/neon/commit/60e549e12feb37a1915ffee4de839d5f375f06b2))
 - **BREAKING** **FIX**(dynamite,nextcloud): escape http methods as reserved method names. ([48233c58](https://github.com/nextcloud/neon/commit/48233c58638da047ca1a6216ecc44d7dd363f77e))
 - **BREAKING** **FIX**(nextcloud): Remove WebDAV export in main library. ([99fe0e91](https://github.com/nextcloud/neon/commit/99fe0e913b4e7c9dcc32a8f6da6c3b5f05fe4168))
 - **BREAKING** **FIX**(nextcloud): Fix AppInfo schema of provisioning_api. ([c760b672](https://github.com/nextcloud/neon/commit/c760b672285de7405516f0c90af62f052c260f1b))
 - **BREAKING** **FIX**(nextcloud): Type WebDAV fileid as integer. ([a298ebed](https://github.com/nextcloud/neon/commit/a298ebed0c5ce92b5b96aeeffc1bab5072900209))
 - **BREAKING** **FEAT**(nextcloud): deserialize webdav date fields. ([e128a2a3](https://github.com/nextcloud/neon/commit/e128a2a3427e62045f23f154ba18dea12802fee0))
 - **BREAKING** **FEAT**(nextcloud): webdav deserialize boolean int fields. ([d49c27cd](https://github.com/nextcloud/neon/commit/d49c27cd731aa8eac8493a2cdbd35b3e4f8faf74))
 - **BREAKING** **FEAT**(nextcloud): webdav deserialize duration fields. ([d10b22a9](https://github.com/nextcloud/neon/commit/d10b22a95a1cf67609fa92f91f002a3df4709a1f))
 - **BREAKING** **FEAT**(nextcloud): Add spreed rich object message parameters. ([9c5e89f6](https://github.com/nextcloud/neon/commit/9c5e89f6957d33e66d90bff3340a3bccf1cad3eb))
 - **BREAKING** **FEAT**(nextcloud): Support server 29 and spreed 19. ([1f39624e](https://github.com/nextcloud/neon/commit/1f39624e7849ce514249858da4c0a537d914a898))
 - **BREAKING** **FEAT**(dynamite): Show field names in oneOf/anyOf validation errors. ([9d236ebc](https://github.com/nextcloud/neon/commit/9d236ebce59da3b9c0e85f2765df36a0ab9f6445))
 - **BREAKING** **CHORE**(nextcloud,nextcloud_test): Remove Nextcloud 26 compatibility. ([17902bcb](https://github.com/nextcloud/neon/commit/17902bcb46a8c33a98a4218c70791cf25ebbe8d2))


## 2024-02-19

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nextcloud` - `v5.0.2`](#nextcloud---v502)

---

#### `nextcloud` - `v5.0.2`

 - **FIX**(nextcloud): Set correct intl version constraint to allow all 0.19.x versions. ([5aea8499](https://github.com/nextcloud/neon/commit/5aea84996b34676f64414a7565c55f5091b508f5))
 - **FIX**(nextcloud): Workaround WebDAV CSRF bug on web. ([c1e051b2](https://github.com/nextcloud/neon/commit/c1e051b265fa53c24b0de5cfda77d4c04557f07a))


## 2024-02-12

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nextcloud` - `v5.0.1`](#nextcloud---v501)

---

#### `nextcloud` - `v5.0.1`

 - **FIX**(nextcloud): Emit errors in WebDAV getStream. ([42619979](https://github.com/nextcloud/neon/commit/4261997994d89cc2234cc2fdbce65733c1d027e8))


## 2024-02-01

### Changes

---

Packages with breaking changes:

 - [`dynamite` - `v0.2.0`](#dynamite---v020)
 - [`dynamite_runtime` - `v0.2.0`](#dynamite_runtime---v020)
 - [`nextcloud` - `v5.0.0`](#nextcloud---v500)

Packages with other changes:

 - There are no other changes in this release.

---

#### `dynamite` - `v0.2.0`

 - **REFACTOR**(dynamite): prefer final over var. ([d4cfedad](https://github.com/nextcloud/neon/commit/d4cfedad9207887b107f5f7642d452bbf2c19dcc))
 - **REFACTOR**(dynamite): remove unnecessary casts. ([5f180065](https://github.com/nextcloud/neon/commit/5f180065f089b3ee618ddc3fa6f3f9ceb740edfd))
 - **REFACTOR**(dynamite): remove unnecessary parenthesis. ([86121af4](https://github.com/nextcloud/neon/commit/86121af46293cb8ae4763629be9df12763f908b2))
 - **REFACTOR**(dynamite): use const for typeresults and custom serializers. ([6d69f9c4](https://github.com/nextcloud/neon/commit/6d69f9c45990f863eab86ac5c68cc5354a99fd5f))
 - **REFACTOR**(dynamite): only use raw strings where necessary. ([48dec25f](https://github.com/nextcloud/neon/commit/48dec25feb457475583f139aa277de83946a0f6e))
 - **PERF**(dynamite): Only initialize clients with tag once. ([1c8f0b5b](https://github.com/nextcloud/neon/commit/1c8f0b5b460c5cb34037e1fa8b6f1717f18b05ea))
 - **FIX**(dynamite): Add Type as keyword. ([aeb54bc0](https://github.com/nextcloud/neon/commit/aeb54bc052cf7452be1a5cf46a93cb31f4f8aceb))
 - **FIX**(dynamite): serialization of someOfs with an array member. ([8e895ff6](https://github.com/nextcloud/neon/commit/8e895ff6750d7b084c8d26f3bfaa57f97667f8f9))
 - **FIX**(dynamite): prefix serializers with $ and use a the private field where possible. ([450883f9](https://github.com/nextcloud/neon/commit/450883f9fb2545607d99827582f86e4f0f8fcd87))
 - **FIX**(dynamite): escape RegExp names. ([2bd9ab48](https://github.com/nextcloud/neon/commit/2bd9ab4855ba3e7709e3136fbe58f4bad36d11cf))
 - **FIX**(dynamite): fix reference to enum types. ([a486a9db](https://github.com/nextcloud/neon/commit/a486a9dbf29e5ab5b6ff42cdc0c91520eb40a7a7))
 - **FIX**(dynamite): do not add . to empty lines. ([29abd811](https://github.com/nextcloud/neon/commit/29abd8110e80ca60dda6c3143ff0cbe7809606b6))
 - **FIX**(dynamite): do not split tags at /. ([c206858d](https://github.com/nextcloud/neon/commit/c206858dbc9dbead99fa610449ac89c4c01bf2df))
 - **FEAT**(dynamite): document generated libraries and add support for all info fields. ([671e1b11](https://github.com/nextcloud/neon/commit/671e1b11174351d68337498e34ffe37872b6e664))
 - **FEAT**(dynamite): use named imports for uri/uri. ([b84324e6](https://github.com/nextcloud/neon/commit/b84324e677279fdad8d62a0ab228084a1b65ae5c))
 - **FEAT**(dynamite): remove dependency on universal_io in the generated code. ([a43b8df0](https://github.com/nextcloud/neon/commit/a43b8df01565fcc94e2a171d6d4a274a49af0080))
 - **FEAT**(dynamite): use named imports for dynamite_runtime/http_client. ([1a111fb4](https://github.com/nextcloud/neon/commit/1a111fb49b8b29d6d2462c88cb2bc3b2a066aaa2))
 - **FEAT**(dynamite): use named imports for built_value/standard_json_plugin. ([4fc34fc8](https://github.com/nextcloud/neon/commit/4fc34fc8c1370d60f8920980ebd394bb0b1f5c01))
 - **FEAT**(dynamite): let code_builder name the dynamite_utils import. ([13838b90](https://github.com/nextcloud/neon/commit/13838b90cc4cef36deb66e0e90e8a73e41acd2a8))
 - **FEAT**(dynamite): add doc comments someOf extensions. ([3cf2f17c](https://github.com/nextcloud/neon/commit/3cf2f17cb0da2e6acb6b14994036ff19fd76f9b4))
 - **FEAT**(dynamite): add doc comments to enums. ([33148f88](https://github.com/nextcloud/neon/commit/33148f88a52de8cad8d1d25fbc9dd350ac19bf6e))
 - **FEAT**(dynamite): add doc comments to built classes. ([0be1fbae](https://github.com/nextcloud/neon/commit/0be1fbae28866518ab2be05114bf6e0ef63ed7ec))
 - **FEAT**(dynamite): add doc comments generated someOfs. ([2a67f060](https://github.com/nextcloud/neon/commit/2a67f060658741fdaed8f9beafbc2b5f543e652c))
 - **FEAT**(dynamite): add doc comments to serializers. ([485386ac](https://github.com/nextcloud/neon/commit/485386ac61bdfc4e502ffd6f91799bbb438d82d9))
 - **FEAT**(dynamite): add generated by comment to warn about manual changes. ([f63dd039](https://github.com/nextcloud/neon/commit/f63dd039fa55a3602a6e27a23a0b0e51f7782004))
 - **FEAT**(dynamite): document clients. ([2ac0a29e](https://github.com/nextcloud/neon/commit/2ac0a29e5ee1cdced044bf6ccfbc58150d06e4af))
 - **BREAKING** **REFACTOR**(dynamite): do not double escape names. ([c4df466a](https://github.com/nextcloud/neon/commit/c4df466a2dc4218b26b5e9e059c6b9103cc2e73f))
 - **BREAKING** **REFACTOR**(dynamite_runtime): make authentication optional. ([24653100](https://github.com/nextcloud/neon/commit/24653100cce43aa5567b7b94bc5c8535ea26c273))
 - **BREAKING** **REFACTOR**(dynamite_runtime): use named parameters for executeRequest methods. ([c022dfb5](https://github.com/nextcloud/neon/commit/c022dfb5cdbd48ead5573d2212f46d8fc1920716))
 - **BREAKING** **REFACTOR**(dynamite): remove unecessary allOf interfaces. ([62fe4187](https://github.com/nextcloud/neon/commit/62fe41872443f8c45ebe7866ed2de126038b8886))
 - **BREAKING** **REFACTOR**(dynamite): do not name generated libraries. ([0df67796](https://github.com/nextcloud/neon/commit/0df6779617b4e5c0eb11e13cd1d43289d9dc18c2))
 - **BREAKING** **FEAT**(dynamite,nextcloud): drop userAgent parameter. ([9d7d86a8](https://github.com/nextcloud/neon/commit/9d7d86a80b1f124ec5e6452ec59b5635f1e9a037))
 - **BREAKING** **FEAT**(dynamite): allow clients from the http package. ([bff69c34](https://github.com/nextcloud/neon/commit/bff69c345130d50d957f057f99d06697fb026568))

#### `dynamite_runtime` - `v0.2.0`

 - **REFACTOR**(dynamite_runtime): stop exporting cookie_jar. ([9f144457](https://github.com/nextcloud/neon/commit/9f1444574c2e2a9bb0b76fefd1f54bfbcf78725f))
 - **FIX**(dynamite_runtime): also send base headers like specified useragent in raw requests. ([6ffd8024](https://github.com/nextcloud/neon/commit/6ffd8024b8c367ef61431e5b90ddb231d04156ee))
 - **FIX**(dynamite_runtime): Stop sending empty cookies. ([bce8c763](https://github.com/nextcloud/neon/commit/bce8c7630265257ed335fe9ac6efcd69a3fae8a0))
 - **FEAT**(dynamite_runtime): Allow access to raw headers in DynamiteRawResponse. ([dc8827de](https://github.com/nextcloud/neon/commit/dc8827def42430ff5f27bd90ed91832cf1e20ae6))
 - **BREAKING** **REFACTOR**(dynamite_runtime): make authentication optional. ([24653100](https://github.com/nextcloud/neon/commit/24653100cce43aa5567b7b94bc5c8535ea26c273))
 - **BREAKING** **REFACTOR**(dynamite_runtime): use named parameters for executeRequest methods. ([c022dfb5](https://github.com/nextcloud/neon/commit/c022dfb5cdbd48ead5573d2212f46d8fc1920716))
 - **BREAKING** **REFACTOR**(dynamite_runtime,nextcloud): make DynamiteApiException extend ClientException. ([b9c4cf0d](https://github.com/nextcloud/neon/commit/b9c4cf0d3aa04ba51556cb97a1577f10d8beb1d9))
 - **BREAKING** **FEAT**(dynamite,nextcloud): drop userAgent parameter. ([9d7d86a8](https://github.com/nextcloud/neon/commit/9d7d86a80b1f124ec5e6452ec59b5635f1e9a037))
 - **BREAKING** **FEAT**(dynamite): allow clients from the http package. ([bff69c34](https://github.com/nextcloud/neon/commit/bff69c345130d50d957f057f99d06697fb026568))

#### `nextcloud` - `v5.0.0`

 - **REFACTOR**(dynamite): remove unnecessary parenthesis. ([86121af4](https://github.com/nextcloud/neon/commit/86121af46293cb8ae4763629be9df12763f908b2))
 - **REFACTOR**(dynamite_runtime): stop exporting cookie_jar. ([9f144457](https://github.com/nextcloud/neon/commit/9f1444574c2e2a9bb0b76fefd1f54bfbcf78725f))
 - **REFACTOR**(tool): Simplify generating specs. ([4392385d](https://github.com/nextcloud/neon/commit/4392385d41c81065ef0dea99abd6237b586dbacc))
 - **PERF**(nextcloud): make webdav props immutable and add constant constructors. ([59a5ea9b](https://github.com/nextcloud/neon/commit/59a5ea9ba2e806d2a66a9d814c382b28800a6822))
 - **PERF**(dynamite): Only initialize clients with tag once. ([1c8f0b5b](https://github.com/nextcloud/neon/commit/1c8f0b5b460c5cb34037e1fa8b6f1717f18b05ea))
 - **FIX**(nextcloud): create file even if webdav response is empty. ([a4948d29](https://github.com/nextcloud/neon/commit/a4948d29a3429ae580e28b8d208dabd2242927bf))
 - **FIX**(nextcloud): Fix dashboard v2 tests. ([5fb4f000](https://github.com/nextcloud/neon/commit/5fb4f00094776c313e22c7be4748300041b9b0a2))
 - **FIX**(dynamite): serialization of someOfs with an array member. ([8e895ff6](https://github.com/nextcloud/neon/commit/8e895ff6750d7b084c8d26f3bfaa57f97667f8f9))
 - **FIX**(dynamite): prefix serializers with $ and use a the private field where possible. ([450883f9](https://github.com/nextcloud/neon/commit/450883f9fb2545607d99827582f86e4f0f8fcd87))
 - **FIX**(nextcloud): Use version range for intl dependency. ([15fbc23f](https://github.com/nextcloud/neon/commit/15fbc23ff3e4008458df2167b447684cd1cb8451))
 - **FIX**(nextcloud): Fix flaky dashboard tests. ([cc012659](https://github.com/nextcloud/neon/commit/cc012659250714be918e95a1343043025113f60d))
 - **FIX**(nextcloud): Stop exporting the crypton package. ([c7218fbd](https://github.com/nextcloud/neon/commit/c7218fbdb17ad78cf85aa8653e80a4f925887f93))
 - **FIX**(deps): update dependency process_run to ^0.14.0+1. ([0c464f89](https://github.com/nextcloud/neon/commit/0c464f89df479632940879a4be70a46eee596bfe))
 - **FEAT**(dynamite): document clients. ([2ac0a29e](https://github.com/nextcloud/neon/commit/2ac0a29e5ee1cdced044bf6ccfbc58150d06e4af))
 - **FEAT**(dynamite): add doc comments generated someOfs. ([2a67f060](https://github.com/nextcloud/neon/commit/2a67f060658741fdaed8f9beafbc2b5f543e652c))
 - **FEAT**(dynamite): add doc comments to built classes. ([0be1fbae](https://github.com/nextcloud/neon/commit/0be1fbae28866518ab2be05114bf6e0ef63ed7ec))
 - **FEAT**(dynamite): add doc comments to enums. ([33148f88](https://github.com/nextcloud/neon/commit/33148f88a52de8cad8d1d25fbc9dd350ac19bf6e))
 - **FEAT**(dynamite): add doc comments someOf extensions. ([3cf2f17c](https://github.com/nextcloud/neon/commit/3cf2f17cb0da2e6acb6b14994036ff19fd76f9b4))
 - **FEAT**(dynamite): add generated by comment to warn about manual changes. ([f63dd039](https://github.com/nextcloud/neon/commit/f63dd039fa55a3602a6e27a23a0b0e51f7782004))
 - **FEAT**(dynamite): let code_builder name the dynamite_utils import. ([13838b90](https://github.com/nextcloud/neon/commit/13838b90cc4cef36deb66e0e90e8a73e41acd2a8))
 - **FEAT**(dynamite): use named imports for built_value/standard_json_plugin. ([4fc34fc8](https://github.com/nextcloud/neon/commit/4fc34fc8c1370d60f8920980ebd394bb0b1f5c01))
 - **FEAT**(dynamite): document generated libraries and add support for all info fields. ([671e1b11](https://github.com/nextcloud/neon/commit/671e1b11174351d68337498e34ffe37872b6e664))
 - **FEAT**(dynamite): use named imports for dynamite_runtime/http_client. ([1a111fb4](https://github.com/nextcloud/neon/commit/1a111fb49b8b29d6d2462c88cb2bc3b2a066aaa2))
 - **FEAT**(dynamite): use named imports for uri/uri. ([b84324e6](https://github.com/nextcloud/neon/commit/b84324e677279fdad8d62a0ab228084a1b65ae5c))
 - **FEAT**(dynamite): add doc comments to serializers. ([485386ac](https://github.com/nextcloud/neon/commit/485386ac61bdfc4e502ffd6f91799bbb438d82d9))
 - **FEAT**(dynamite): remove dependency on universal_io in the generated code. ([a43b8df0](https://github.com/nextcloud/neon/commit/a43b8df01565fcc94e2a171d6d4a274a49af0080))
 - **BREAKING** **REFACTOR**(tool): Pin our own version of openapi-extractor. ([a3a04129](https://github.com/nextcloud/neon/commit/a3a041297f93d3d3108cf7167e3129f8c5d81528))
 - **BREAKING** **REFACTOR**(dynamite_runtime,nextcloud): make DynamiteApiException extend ClientException. ([b9c4cf0d](https://github.com/nextcloud/neon/commit/b9c4cf0d3aa04ba51556cb97a1577f10d8beb1d9))
 - **BREAKING** **REFACTOR**(dynamite_runtime): use named parameters for executeRequest methods. ([c022dfb5](https://github.com/nextcloud/neon/commit/c022dfb5cdbd48ead5573d2212f46d8fc1920716))
 - **BREAKING** **REFACTOR**(dynamite_runtime): make authentication optional. ([24653100](https://github.com/nextcloud/neon/commit/24653100cce43aa5567b7b94bc5c8535ea26c273))
 - **BREAKING** **REFACTOR**(dynamite): do not double escape names. ([c4df466a](https://github.com/nextcloud/neon/commit/c4df466a2dc4218b26b5e9e059c6b9103cc2e73f))
 - **BREAKING** **REFACTOR**(dynamite): do not name generated libraries. ([0df67796](https://github.com/nextcloud/neon/commit/0df6779617b4e5c0eb11e13cd1d43289d9dc18c2))
 - **BREAKING** **REFACTOR**(dynamite): remove unecessary allOf interfaces. ([62fe4187](https://github.com/nextcloud/neon/commit/62fe41872443f8c45ebe7866ed2de126038b8886))
 - **BREAKING** **FEAT**(dynamite): allow clients from the http package. ([bff69c34](https://github.com/nextcloud/neon/commit/bff69c345130d50d957f057f99d06697fb026568))
 - **BREAKING** **FEAT**(dynamite,nextcloud): drop userAgent parameter. ([9d7d86a8](https://github.com/nextcloud/neon/commit/9d7d86a80b1f124ec5e6452ec59b5635f1e9a037))
 - **BREAKING** **FEAT**(nextcloud): Support onProgress in WebDAV getStream. ([27a3eebf](https://github.com/nextcloud/neon/commit/27a3eebf581e53b7e986179ec3dddbee8f5d4f7c))
 - **BREAKING** **FEAT**(nextcloud): Update server to 28.0.2. ([3bc3a9f8](https://github.com/nextcloud/neon/commit/3bc3a9f8f7c1ab771fe92cd1e79bf7193ed1f12d))
 - **BREAKING** **CHORE**(deps): Update openapi-extractor. ([6b270b2e](https://github.com/nextcloud/neon/commit/6b270b2e88949934549fdd1e6ac704f3b963b7e3))


## 2023-12-26

### Changes

---

Packages with breaking changes:

 - [`nextcloud` - `v4.0.0`](#nextcloud---v400)

Packages with other changes:

 - There are no other changes in this release.

Packages graduated to a stable release (see pre-releases prior to the stable version for changelog entries):

 - `nextcloud` - `v4.0.0`

---

#### `nextcloud` - `v4.0.0`


## 2023-12-26

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`dynamite` - `v0.1.0`](#dynamite---v010)
 - [`dynamite_runtime` - `v0.1.0`](#dynamite_runtime---v010)

Packages graduated to a stable release (see pre-releases prior to the stable version for changelog entries):

 - `dynamite` - `v0.1.0`
 - `dynamite_runtime` - `v0.1.0`

---

#### `dynamite` - `v0.1.0`

#### `dynamite_runtime` - `v0.1.0`


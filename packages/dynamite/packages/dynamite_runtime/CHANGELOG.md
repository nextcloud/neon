## 0.4.0

> Note: This release has breaking changes.

 - **FEAT**(dynamite_runtime): add support for number validators. ([90f5924c](https://github.com/nextcloud/neon/commit/90f5924c3ba0787e7a155f0d07fea0a16bb2ff4e))
 - **FEAT**(dynamite_runtime): add validators that accept dynamic also working on JsonObject. ([6e8ec22f](https://github.com/nextcloud/neon/commit/6e8ec22f4dd894ab949a130214d293c246c13083))
 - **BREAKING** **REFACTOR**(dynamite_runtime): remove deprecated methods. ([ad608fec](https://github.com/nextcloud/neon/commit/ad608fec0e232616db77d924b2ad90ea26458fae))

## 0.3.0

> Note: This release has breaking changes.

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

## 0.2.0

> Note: This release has breaking changes.

 - **REFACTOR**(dynamite_runtime): stop exporting cookie_jar. ([9f144457](https://github.com/nextcloud/neon/commit/9f1444574c2e2a9bb0b76fefd1f54bfbcf78725f))
 - **FIX**(dynamite_runtime): also send base headers like specified useragent in raw requests. ([6ffd8024](https://github.com/nextcloud/neon/commit/6ffd8024b8c367ef61431e5b90ddb231d04156ee))
 - **FIX**(dynamite_runtime): Stop sending empty cookies. ([bce8c763](https://github.com/nextcloud/neon/commit/bce8c7630265257ed335fe9ac6efcd69a3fae8a0))
 - **FEAT**(dynamite_runtime): Allow access to raw headers in DynamiteRawResponse. ([dc8827de](https://github.com/nextcloud/neon/commit/dc8827def42430ff5f27bd90ed91832cf1e20ae6))
 - **BREAKING** **REFACTOR**(dynamite_runtime): make authentication optional. ([24653100](https://github.com/nextcloud/neon/commit/24653100cce43aa5567b7b94bc5c8535ea26c273))
 - **BREAKING** **REFACTOR**(dynamite_runtime): use named parameters for executeRequest methods. ([c022dfb5](https://github.com/nextcloud/neon/commit/c022dfb5cdbd48ead5573d2212f46d8fc1920716))
 - **BREAKING** **REFACTOR**(dynamite_runtime,nextcloud): make DynamiteApiException extend ClientException. ([b9c4cf0d](https://github.com/nextcloud/neon/commit/b9c4cf0d3aa04ba51556cb97a1577f10d8beb1d9))
 - **BREAKING** **FEAT**(dynamite,nextcloud): drop userAgent parameter. ([9d7d86a8](https://github.com/nextcloud/neon/commit/9d7d86a80b1f124ec5e6452ec59b5635f1e9a037))
 - **BREAKING** **FEAT**(dynamite): allow clients from the http package. ([bff69c34](https://github.com/nextcloud/neon/commit/bff69c345130d50d957f057f99d06697fb026568))

## 0.1.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.


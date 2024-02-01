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


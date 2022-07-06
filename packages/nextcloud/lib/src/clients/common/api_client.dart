// @dart=2.12

part of openapi.api;

abstract class BaseApiClient {
  Future<String> serializeAsync(Object? value);

  Future<dynamic> deserializeAsync(
    String json,
    String targetType, {
    bool growable = false,
  });

  void addDefaultHeader(String key, String value);
}

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart' show internal;
import 'package:neon_framework/src/storage/persistence.dart';

/// An FlutterSecureStorage backed persistence persisting values encrypted at rest.
@immutable
@internal
final class SecurePersistence implements Persistence<String> {
  /// Creates a new secure storage.
  const SecurePersistence();

  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  Future<bool> clear() async {
    try {
      await _storage.deleteAll();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      return false;
    }

    return true;
  }

  @override
  Future<bool> remove(String key) async {
    try {
      await _storage.delete(key: key);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      return false;
    }

    return true;
  }

  @override
  Future<bool> setValue(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      return false;
    }

    return true;
  }

  @override
  Future<bool> containsKey(String key) async {
    try {
      final result = await _storage.containsKey(key: key);
      return result;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }

    return false;
  }

  @override
  Future<String?> getValue(String key) async {
    try {
      final value = await _storage.read(key: key);
      return value;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }

    return null;
  }
}

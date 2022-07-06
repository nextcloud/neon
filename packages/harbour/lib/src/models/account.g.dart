// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      serverURL: json['serverURL'] as String,
      username: json['username'] as String,
      password: json['password'] as String?,
      appPassword: json['appPassword'] as String?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'serverURL': instance.serverURL,
      'username': instance.username,
      'password': instance.password,
      'appPassword': instance.appPassword,
    };

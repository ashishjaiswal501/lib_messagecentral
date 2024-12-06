// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cache_manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCacheManager _$UserCacheManagerFromJson(Map<String, dynamic> json) =>
    UserCacheManager(
      authToken: json['authToken'] as String? ?? '',
      customerId: json['customerId'] as String? ?? '',
      isuserAutheticated: json['isuserAutheticated'] as bool? ?? false,
    );

Map<String, dynamic> _$UserCacheManagerToJson(UserCacheManager instance) =>
    <String, dynamic>{
      'authToken': instance.authToken,
      'customerId': instance.customerId,
      'isuserAutheticated': instance.isuserAutheticated,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_login_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestPrams _$LoginRequestPramsFromJson(Map<String, dynamic> json) =>
    LoginRequestPrams(
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$LoginRequestPramsToJson(LoginRequestPrams instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

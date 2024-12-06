// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_signup_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestPrams _$SignupRequestPramsFromJson(Map<String, dynamic> json) =>
    SignupRequestPrams(
      fullName: json['fullName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$SignupRequestPramsToJson(SignupRequestPrams instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
    };

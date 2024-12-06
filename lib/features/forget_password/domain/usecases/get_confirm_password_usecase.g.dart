// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_confirm_password_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmPasswordRequestPrams _$ConfirmPasswordRequestPramsFromJson(
        Map<String, dynamic> json) =>
    ConfirmPasswordRequestPrams(
      email: json['email'] as String? ?? '',
      newPassword: json['newPassword'] as String? ?? '',
      authToken: json['authToken'] as String? ?? '',
    );

Map<String, dynamic> _$ConfirmPasswordRequestPramsToJson(
        ConfirmPasswordRequestPrams instance) =>
    <String, dynamic>{
      'email': instance.email,
      'newPassword': instance.newPassword,
      'authToken': instance.authToken,
    };

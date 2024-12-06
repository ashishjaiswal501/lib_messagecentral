// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_update_password_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmPasswordRequest _$ConfirmPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ConfirmPasswordRequest(
      customerId: json['customerId'] as String? ?? '',
      newPassword: json['newPassword'] as String? ?? '',
      oldPassword: json['oldPassword'] as String? ?? '',
    );

Map<String, dynamic> _$ConfirmPasswordRequestToJson(
        ConfirmPasswordRequest instance) =>
    <String, dynamic>{
      'newPassword': instance.newPassword,
      'oldPassword': instance.oldPassword,
      'customerId': instance.customerId,
    };

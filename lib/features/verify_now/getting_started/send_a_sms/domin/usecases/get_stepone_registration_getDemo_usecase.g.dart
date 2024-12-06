// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_stepone_registration_getDemo_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SteponeRegistrationGetPrams _$SteponeRegistrationGetPramsFromJson(
        Map<String, dynamic> json) =>
    SteponeRegistrationGetPrams(
      customerId: json['customerId'] as String? ?? '',
      authToken: json['authToken'] as String? ?? '',
    );

Map<String, dynamic> _$SteponeRegistrationGetPramsToJson(
        SteponeRegistrationGetPrams instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'authToken': instance.authToken,
    };

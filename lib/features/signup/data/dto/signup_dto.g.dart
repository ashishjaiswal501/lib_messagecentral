// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignupDtoImpl _$$SignupDtoImplFromJson(Map<String, dynamic> json) =>
    _$SignupDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SignupDtoImplToJson(_$SignupDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      tempToken: json['tempToken'] as String?,
      customerId: json['customerId'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'tempToken': instance.tempToken,
      'customerId': instance.customerId,
      'email': instance.email,
    };

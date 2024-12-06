// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_verify_otp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignupVerifyOtpDtoImpl _$$SignupVerifyOtpDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SignupVerifyOtpDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SignupVerifyOtpDtoImplToJson(
        _$SignupVerifyOtpDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      authToken: json['authToken'] as String?,
      customerId: json['customerId'] as String?,
      accountStatus: json['accountStatus'] as String?,
      countryCode: json['countryCode'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'authToken': instance.authToken,
      'customerId': instance.customerId,
      'accountStatus': instance.accountStatus,
      'countryCode': instance.countryCode,
      'mobileNumber': instance.mobileNumber,
    };

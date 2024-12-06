// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_otp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignupOtpDtoImpl _$$SignupOtpDtoImplFromJson(Map<String, dynamic> json) =>
    _$SignupOtpDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SignupOtpDtoImplToJson(_$SignupOtpDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      customerId: json['customerId'] as String?,
      otpVerificationId: json['otpVerificationId'] as String?,
      accountStatus: json['accountStatus'] as String?,
      countryStatus: json['countryStatus'] as String?,
      countryCode: json['countryCode'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      countryName: json['countryName'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'otpVerificationId': instance.otpVerificationId,
      'accountStatus': instance.accountStatus,
      'countryStatus': instance.countryStatus,
      'countryCode': instance.countryCode,
      'mobileNumber': instance.mobileNumber,
      'countryName': instance.countryName,
      'fullName': instance.fullName,
      'email': instance.email,
    };

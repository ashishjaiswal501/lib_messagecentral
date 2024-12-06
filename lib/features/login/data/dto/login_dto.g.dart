// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginDtoImpl _$$LoginDtoImplFromJson(Map<String, dynamic> json) =>
    _$LoginDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginDtoImplToJson(_$LoginDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      authToken: json['authToken'] as String?,
      tempToken: json['tempToken'] as String?,
      customerId: json['customerId'] as String?,
      accountStatus: json['accountStatus'] as String?,
      countryStatus: json['countryStatus'] as String?,
      countryCode: json['countryCode'] as String?,
      phoneNo: json['phoneNo'] as String?,
      mobileNumberAvailable: json['mobileNumberAvailable'] as String?,
      firstName: json['firstName'] as String?,
      email: json['email'] as String?,
      otpVerification: json['otpVerification'] as bool?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'authToken': instance.authToken,
      'tempToken': instance.tempToken,
      'customerId': instance.customerId,
      'accountStatus': instance.accountStatus,
      'countryStatus': instance.countryStatus,
      'countryCode': instance.countryCode,
      'phoneNo': instance.phoneNo,
      'mobileNumberAvailable': instance.mobileNumberAvailable,
      'firstName': instance.firstName,
      'email': instance.email,
      'otpVerification': instance.otpVerification,
    };

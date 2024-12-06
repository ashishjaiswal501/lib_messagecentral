// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_Otp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgetPasswordOtpDtoImpl _$$ForgetPasswordOtpDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ForgetPasswordOtpDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ForgetPasswordOtpDtoImplToJson(
        _$ForgetPasswordOtpDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      verificationId: (json['verificationId'] as num?)?.toInt(),
      mobileNumber: json['mobileNumber'] as String?,
      verificationStatus: json['verificationStatus'] as String?,
      responseCode: json['responseCode'] as String?,
      errorMessage: json['errorMessage'],
      transactionId: json['transactionId'],
      authToken: json['authToken'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'verificationId': instance.verificationId,
      'mobileNumber': instance.mobileNumber,
      'verificationStatus': instance.verificationStatus,
      'responseCode': instance.responseCode,
      'errorMessage': instance.errorMessage,
      'transactionId': instance.transactionId,
      'authToken': instance.authToken,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResendOtpDtoImpl _$$ResendOtpDtoImplFromJson(Map<String, dynamic> json) =>
    _$ResendOtpDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResendOtpDtoImplToJson(_$ResendOtpDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      verificationId: json['verificationId'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      responseCode: json['responseCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      timeout: json['timeout'] as String?,
      smsCli: json['smsCLI'],
      transactionId: json['transactionId'],
      newUser: json['newUser'] as bool?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'verificationId': instance.verificationId,
      'mobileNumber': instance.mobileNumber,
      'responseCode': instance.responseCode,
      'errorMessage': instance.errorMessage,
      'timeout': instance.timeout,
      'smsCLI': instance.smsCli,
      'transactionId': instance.transactionId,
      'newUser': instance.newUser,
    };

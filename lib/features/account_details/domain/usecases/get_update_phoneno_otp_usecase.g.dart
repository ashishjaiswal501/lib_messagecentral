// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_update_phoneno_otp_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePhoneNoOtpRequest _$UpdatePhoneNoOtpRequestFromJson(
        Map<String, dynamic> json) =>
    UpdatePhoneNoOtpRequest(
      phoneNumber: json['phoneNumber'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
    );

Map<String, dynamic> _$UpdatePhoneNoOtpRequestToJson(
        UpdatePhoneNoOtpRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'countryCode': instance.countryCode,
    };

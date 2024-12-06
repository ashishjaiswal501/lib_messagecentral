// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stepone_register_save_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SteponeRegisterSaveDtoImpl _$$SteponeRegisterSaveDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SteponeRegisterSaveDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SteponeRegisterSaveDtoImplToJson(
        _$SteponeRegisterSaveDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      userName: json['userName'] as String?,
      companyName: json['companyName'] as String?,
      companyWebsite: json['companyWebsite'] as String?,
      workingEmail: json['workingEmail'] as String?,
      contactNumber: json['contactNumber'] as String?,
      countryToSendSms: json['countryToSendSMS'] as String?,
      hasIndianRegisteredSenderId: json['hasIndianRegisteredSenderID'] as bool?,
      usageDescription: json['usageDescription'] as String?,
      userAccountType: json['userAccountType'] as String?,
      userAddress: json['userAddress'] as String?,
      userCountry: json['userCountry'] as String?,
      userCity: json['userCity'] as String?,
      userState: json['userState'] as String?,
      userZipCode: (json['userZipCode'] as num?)?.toInt(),
      resellerType: json['resellerType'] as bool?,
      customerId: json['customerId'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'companyName': instance.companyName,
      'companyWebsite': instance.companyWebsite,
      'workingEmail': instance.workingEmail,
      'contactNumber': instance.contactNumber,
      'countryToSendSMS': instance.countryToSendSms,
      'hasIndianRegisteredSenderID': instance.hasIndianRegisteredSenderId,
      'usageDescription': instance.usageDescription,
      'userAccountType': instance.userAccountType,
      'userAddress': instance.userAddress,
      'userCountry': instance.userCountry,
      'userCity': instance.userCity,
      'userState': instance.userState,
      'userZipCode': instance.userZipCode,
      'resellerType': instance.resellerType,
      'customerId': instance.customerId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stepone_registration_save_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SteponeRegistrationSavePrams _$SteponeRegistrationSavePramsFromJson(
        Map<String, dynamic> json) =>
    SteponeRegistrationSavePrams(
      name: json['name'] as String? ?? '',
      companyName: json['companyName'] as String? ?? '',
      companyWebsite: json['companyWebsite'] as String? ?? '',
      workingEmail: json['workingEmail'] as String? ?? '',
      contactNumber: json['contactNumber'] as String? ?? '',
      countryToSendSMS: json['countryToSendSMS'] as String? ?? '',
      hasIndianRegisteredID: json['hasIndianRegisteredID'] as bool? ?? true,
      usageDescription: json['usageDescription'] as String? ?? '',
      userAccountType: json['userAccountType'] as String? ?? '',
      userAddress: json['userAddress'] as String? ?? '',
      userCountry: json['userCountry'] as String? ?? '',
      userCity: json['userCity'] as String? ?? '',
      userState: json['userState'] as String? ?? '',
      userZipCode: json['userZipCode'] as String? ?? '',
      resellerType: json['resellerType'] as bool? ?? false,
      authToken: json['authToken'] as String? ?? '',
    );

Map<String, dynamic> _$SteponeRegistrationSavePramsToJson(
        SteponeRegistrationSavePrams instance) =>
    <String, dynamic>{
      'name': instance.name,
      'companyName': instance.companyName,
      'companyWebsite': instance.companyWebsite,
      'workingEmail': instance.workingEmail,
      'contactNumber': instance.contactNumber,
      'countryToSendSMS': instance.countryToSendSMS,
      'hasIndianRegisteredID': instance.hasIndianRegisteredID,
      'usageDescription': instance.usageDescription,
      'userAccountType': instance.userAccountType,
      'userAddress': instance.userAddress,
      'userCountry': instance.userCountry,
      'userCity': instance.userCity,
      'userState': instance.userState,
      'userZipCode': instance.userZipCode,
      'resellerType': instance.resellerType,
      'authToken': instance.authToken,
    };

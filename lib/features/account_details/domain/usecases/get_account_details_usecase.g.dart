// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_details_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetailsRequest _$AccountDetailsRequestFromJson(
        Map<String, dynamic> json) =>
    AccountDetailsRequest(
      customerId: json['customerId'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      address: json['address'] as String? ?? '',
      city: json['city'] as String? ?? '',
      country: json['country'] as String? ?? '',
      postalCode: json['postalCode'] as String? ?? '',
      state: json['state'] as String? ?? '',
    );

Map<String, dynamic> _$AccountDetailsRequestToJson(
        AccountDetailsRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'customerId': instance.customerId,
      'lastName': instance.lastName,
      'email': instance.email,
    };

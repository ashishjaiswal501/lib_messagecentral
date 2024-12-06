// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_password_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfirmPasswordDtoImpl _$$ConfirmPasswordDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfirmPasswordDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConfirmPasswordDtoImplToJson(
        _$ConfirmPasswordDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      customerId: json['customerId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'],
      email: json['email'] as String?,
      password: json['password'] as String?,
      phoneCode: json['phoneCode'] as String?,
      phoneNo: json['phoneNo'] as String?,
      application: json['application'],
      wallet: json['wallet'],
      authToken: json['authToken'],
      createdDateTime: json['createdDateTime'] == null
          ? null
          : DateTime.parse(json['createdDateTime'] as String),
      updatedDateTime: json['updatedDateTime'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
      country: json['country'],
      newUser: json['newUser'] as bool?,
      brandName: json['brandName'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'phoneCode': instance.phoneCode,
      'phoneNo': instance.phoneNo,
      'application': instance.application,
      'wallet': instance.wallet,
      'authToken': instance.authToken,
      'createdDateTime': instance.createdDateTime?.toIso8601String(),
      'updatedDateTime': instance.updatedDateTime,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'newUser': instance.newUser,
      'brandName': instance.brandName,
    };

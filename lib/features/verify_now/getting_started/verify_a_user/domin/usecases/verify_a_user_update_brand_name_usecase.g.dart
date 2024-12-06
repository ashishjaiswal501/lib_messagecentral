// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_a_user_update_brand_name_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyAUserUpdateBrandNamePrams _$VerifyAUserUpdateBrandNamePramsFromJson(
        Map<String, dynamic> json) =>
    VerifyAUserUpdateBrandNamePrams(
      brandName: json['brandName'] as String? ?? '',
      customerId: json['customerId'] as String? ?? '',
      authToken: json['authToken'] as String? ?? '',
    );

Map<String, dynamic> _$VerifyAUserUpdateBrandNamePramsToJson(
        VerifyAUserUpdateBrandNamePrams instance) =>
    <String, dynamic>{
      'brandName': instance.brandName,
      'customerId': instance.customerId,
      'authToken': instance.authToken,
    };

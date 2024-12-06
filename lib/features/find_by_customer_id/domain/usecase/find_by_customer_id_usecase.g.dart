// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_by_customer_id_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindByCustomerIdPrams _$FindByCustomerIdPramsFromJson(
        Map<String, dynamic> json) =>
    FindByCustomerIdPrams(
      customerId: json['customerId'] as String? ?? '',
      authToken: json['authToken'] as String? ?? '',
    );

Map<String, dynamic> _$FindByCustomerIdPramsToJson(
        FindByCustomerIdPrams instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'authToken': instance.authToken,
    };

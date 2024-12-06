// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_balance_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletBalancePrams _$WalletBalancePramsFromJson(Map<String, dynamic> json) =>
    WalletBalancePrams(
      customerId: json['customerId'] as String? ?? '',
      authToken: json['authToken'] as String? ?? '',
    );

Map<String, dynamic> _$WalletBalancePramsToJson(WalletBalancePrams instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'authToken': instance.authToken,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUserDetailsDtoImpl _$$GetUserDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUserDetailsDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetUserDetailsDtoImplToJson(
        _$GetUserDetailsDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      countryCode: json['countryCode'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      wallet: json['wallet'] == null
          ? null
          : Wallet.fromJson(json['wallet'] as Map<String, dynamic>),
      subscription: json['subscription'] == null
          ? null
          : Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'countryCode': instance.countryCode,
      'phone': instance.phone,
      'email': instance.email,
      'wallet': instance.wallet,
      'subscription': instance.subscription,
    };

_$SubscriptionImpl _$$SubscriptionImplFromJson(Map<String, dynamic> json) =>
    _$SubscriptionImpl(
      lastSubscriptionDate: json['lastSubscriptionDate'],
      subscribed: json['subscribed'] as bool?,
    );

Map<String, dynamic> _$$SubscriptionImplToJson(_$SubscriptionImpl instance) =>
    <String, dynamic>{
      'lastSubscriptionDate': instance.lastSubscriptionDate,
      'subscribed': instance.subscribed,
    };

_$WalletImpl _$$WalletImplFromJson(Map<String, dynamic> json) => _$WalletImpl(
      credits: (json['credits'] as num?)?.toDouble(),
      lastRechargedCredit: (json['lastRechargedCredit'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$WalletImplToJson(_$WalletImpl instance) =>
    <String, dynamic>{
      'credits': instance.credits,
      'lastRechargedCredit': instance.lastRechargedCredit,
    };

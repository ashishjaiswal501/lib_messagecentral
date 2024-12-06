import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_details_entity.freezed.dart';

@freezed
class GetUserDetailsEntity with _$GetUserDetailsEntity {
  const factory GetUserDetailsEntity({
    final int? responseCode,
    final String? message,
    final GetUserData? data,
  }) = _GetUserDetailsEntity;
}

@freezed
class GetUserData with _$GetUserData {
  const factory GetUserData({
     String? firstName,
     String? lastName,
     String? countryCode,
     String? phone,
     String? email,
     WalletEntity? wallet,
     SubscriptionEntity? subscription,
  }) = _GetUserData;
}

@freezed
class SubscriptionEntity with _$SubscriptionEntity {
  const factory SubscriptionEntity({
     dynamic lastSubscriptionDate,
     bool? subscribed,
  }) = _SubscriptionEntity;
}

@freezed
class WalletEntity with _$WalletEntity {
  const factory WalletEntity({
     double? credits,
     double? lastRechargedCredit,
  }) = _WalletEntity;
}

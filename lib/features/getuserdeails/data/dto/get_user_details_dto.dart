import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/getuserdeails/domain/enitity/get_user_details_entity.dart';
part 'get_user_details_dto.freezed.dart';
part 'get_user_details_dto.g.dart';

@freezed
class GetUserDetailsDto with _$GetUserDetailsDto {
  const factory GetUserDetailsDto({
    @JsonKey(name: "responseCode") int? responseCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _GetUserDetailsDto;

  factory GetUserDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$GetUserDetailsDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "firstName") String? firstName,
    @JsonKey(name: "lastName") String? lastName,
    @JsonKey(name: "countryCode") String? countryCode,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "wallet") Wallet? wallet,
    @JsonKey(name: "subscription") Subscription? subscription,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Subscription with _$Subscription {
  const factory Subscription({
    @JsonKey(name: "lastSubscriptionDate") dynamic lastSubscriptionDate,
    @JsonKey(name: "subscribed") bool? subscribed,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}

@freezed
class Wallet with _$Wallet {
  const factory Wallet({
    @JsonKey(name: "credits") double? credits,
    @JsonKey(name: "lastRechargedCredit") double? lastRechargedCredit,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}

extension GetUserDetailsEntityExtension on GetUserDetailsDto {
  GetUserDetailsEntity get toEntity => GetUserDetailsEntity(
        responseCode: responseCode,
        message: message,
        data: data?.toEntity()
      );
}



extension GetUserDataEntityExtention on Data {
  GetUserData toEntity() {
    return GetUserData(
      
      firstName: firstName??"",
      lastName: lastName??"",
      email: email??"",
      countryCode: countryCode??"",
      phone: phone??"",
      wallet: wallet?.toEntityWallet,
      subscription: subscription?.toEntitySubscription
    );
  }
}

extension WalletEntityExtension on Wallet {
  WalletEntity get toEntityWallet => WalletEntity(
       credits: credits,
       lastRechargedCredit: lastRechargedCredit

      );
}
extension SubscriptionEntityExtension on Subscription {
  SubscriptionEntity get toEntitySubscription => SubscriptionEntity(
      lastSubscriptionDate: lastSubscriptionDate,
      subscribed: subscribed??false
       
      );
}



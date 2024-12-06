// To parse this JSON data, do
//
//     final walletBalanceDto = walletBalanceDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:messagecentral/features/wallet_balance/domain/enitity/wallet_balance_entity.dart';

part 'wallet_balance_dto.freezed.dart';
part 'wallet_balance_dto.g.dart';


@freezed
class WalletBalanceDto with _$WalletBalanceDto {
    const factory WalletBalanceDto({
        @JsonKey(name: "responseCode")
        int? responseCode,
        @JsonKey(name: "message")
        String? message,
        @JsonKey(name: "data")
        Data? data,
    }) = _WalletBalanceDto;

    factory WalletBalanceDto.fromJson(Map<String, dynamic> json) => _$WalletBalanceDtoFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        @JsonKey(name: "customerId")
        String? customerId,
        @JsonKey(name: "credits")
        double? credits,
        @JsonKey(name: "lastRechargedCredit")
        double? lastRechargedCredit,
        @JsonKey(name: "createdDateTime")
        DateTime? createdDateTime,
        @JsonKey(name: "updatedDateTime")
        DateTime? updatedDateTime,
        @JsonKey(name: "minimumCreditsAllowed")
        String? minimumCreditsAllowed,
        @JsonKey(name: "userPaid")
        bool? userPaid,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}




extension WalletBalanceEntityExtension on WalletBalanceDto {
  WalletBalanceEntity get toEntity => WalletBalanceEntity(
        responseCode: responseCode,
        message: message,
        data: data?.toEntity(),
      );
}

extension  WalletBalanceDataEntityExtention on Data {
  GetUserData toEntity() {
    return GetUserData(
        customerId: customerId,
        credits: credits,
        lastRechargedCredit: lastRechargedCredit,
        createdDateTime: createdDateTime,
        updatedDateTime: updatedDateTime,
        minimumCreditsAllowed: minimumCreditsAllowed,
        userPaid: userPaid,);
  }
}
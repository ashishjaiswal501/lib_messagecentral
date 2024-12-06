import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_balance_entity.freezed.dart';

@freezed
class WalletBalanceEntity with _$WalletBalanceEntity {
  const factory WalletBalanceEntity({
    final int? responseCode,
    final String? message,
    final GetUserData? data,
  }) = _WalletBalanceEntity;
}

@freezed
class GetUserData with _$GetUserData {
  const factory GetUserData({
     String? customerId,
     double? credits,
     double? lastRechargedCredit,
     DateTime? createdDateTime,
     DateTime? updatedDateTime,
     String? minimumCreditsAllowed,
     bool? userPaid,
  }) = _GetUserData;
}

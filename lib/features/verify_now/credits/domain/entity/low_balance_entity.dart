import 'package:freezed_annotation/freezed_annotation.dart';

part 'low_balance_entity.freezed.dart';

@unfreezed
class LowBalanceEntity with _$LowBalanceEntity {
  factory LowBalanceEntity({
    int? responseCode,
    String? message,
    DataLowBalance? data,
  }) = _LowBalanceEntity;
}

@unfreezed
class DataLowBalance with _$DataLowBalance {
  factory DataLowBalance({
    String? customerId,
    int? alertAmount,
    dynamic alternaletcountryCode1,
    dynamic alternatePhoneNo1,
    dynamic alternaletcountryCode2,
    dynamic alternatePhoneNo2,
    bool? lowBalanceAlertFlag,
    bool? islowBalanceAlertSent,
    dynamic lowBalanceAlertSentDateTime,
  }) = _DataLowBalance;
}

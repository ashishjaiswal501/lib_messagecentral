import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/verify_now/credits/domain/entity/low_balance_entity.dart';
part 'low_balance_alert_save_state.freezed.dart';

@unfreezed
class LowBalanceAlertSaveState with _$LowBalanceAlertSaveState {
  factory LowBalanceAlertSaveState.initial() = _Initial;
  factory LowBalanceAlertSaveState.loading() = _Loading;
  factory LowBalanceAlertSaveState.success(LowBalanceEntity lowBalanceEntity) = _Success;
  factory LowBalanceAlertSaveState.error(String errorMessage) = _Error;
}
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/verify_now/credits/domain/entity/low_balance_entity.dart';
part 'low_balance_state.freezed.dart';

@unfreezed
class LowBalanceState with _$LowBalanceState {
  factory LowBalanceState.initial() = _Initial;
  factory LowBalanceState.loading() = _Loading;
  factory LowBalanceState.success(LowBalanceEntity lowBalanceEntity) = _Success;
  factory LowBalanceState.error(String errorMessage) = _Error;
}

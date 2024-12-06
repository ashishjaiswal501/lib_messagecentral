import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/verify_now/credits/domain/entity/payment_history_entity.dart';
part 'payment_history_state.freezed.dart';

@unfreezed
class PaymentHistoryState with _$PaymentHistoryState {
  factory PaymentHistoryState.initial() = _Initial;
  factory PaymentHistoryState.loading() = _Loading;
  factory PaymentHistoryState.empty() = _Empty;
  factory PaymentHistoryState.success(
      PaymentHistoryEntity paymentHistoryEntity) = _Success;
  factory PaymentHistoryState.error(String errorMessage) = _Error;
}


import 'package:freezed_annotation/freezed_annotation.dart';


part 'payment_history_entity.freezed.dart';
@freezed
class PaymentHistoryEntity with _$PaymentHistoryEntity {
    const factory PaymentHistoryEntity({
        int? responseCode,
        String? message,
        List<PaymentData>? data,
    }) = _PaymentHistoryEntity;
}

@freezed
class PaymentData with _$PaymentData {
    const factory PaymentData({
        int? id,
        String? customerId,
        dynamic transactionId,
        DateTime? transactionDateTime,
        double? creditsPurchased,
        double? balanceBeforePurchased,
        double? balanceAfterPurchased,
        String? creditsType,
    }) = _PaymentData;
}

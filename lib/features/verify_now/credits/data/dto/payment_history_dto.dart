// To parse this JSON data, do
//
//     final paymentHistoryDto = paymentHistoryDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/verify_now/credits/domain/entity/payment_history_entity.dart';

part 'payment_history_dto.freezed.dart';
part 'payment_history_dto.g.dart';

@freezed
class PaymentHistoryDto with _$PaymentHistoryDto {
  const factory PaymentHistoryDto({
    @JsonKey(name: "responseCode") int? responseCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<Datum>? data,
  }) = _PaymentHistoryDto;

  factory PaymentHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoryDtoFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "customerId") String? customerId,
    @JsonKey(name: "transactionId") dynamic transactionId,
    @JsonKey(name: "transactionDateTime") DateTime? transactionDateTime,
    @JsonKey(name: "creditsPurchased") double? creditsPurchased,
    @JsonKey(name: "balanceBeforePurchased") double? balanceBeforePurchased,
    @JsonKey(name: "balanceAfterPurchased") double? balanceAfterPurchased,
    @JsonKey(name: "creditsType") String? creditsType,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

extension PaymentHistoryEntityExtension on PaymentHistoryDto {
  PaymentHistoryEntity get toEntity => PaymentHistoryEntity(
      responseCode: responseCode,
      message: message,
      data: data?.map((e) => e.toEntity()).toList() ?? []);
}

extension PaymentDataEntityExtention on Datum {
  PaymentData toEntity() {
    return PaymentData(
        id: id,
        customerId: customerId,
        transactionDateTime: transactionDateTime,
        transactionId: transactionId,
        creditsPurchased: creditsPurchased,
        creditsType: creditsType,
        balanceAfterPurchased: balanceAfterPurchased,
        balanceBeforePurchased: balanceBeforePurchased);
  }
}

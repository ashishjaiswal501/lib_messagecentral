// To parse this JSON data, do
//
//     final lowBalanceDto = lowBalanceDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/verify_now/credits/domain/entity/low_balance_entity.dart';

part 'low_balance_dto.freezed.dart';
part 'low_balance_dto.g.dart';

@freezed
class LowBalanceDto with _$LowBalanceDto {
  const factory LowBalanceDto({
    @JsonKey(name: "responseCode") int? responseCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _LowBalanceDto;

  factory LowBalanceDto.fromJson(Map<String, dynamic> json) =>
      _$LowBalanceDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "customerId") String? customerId,
    @JsonKey(name: "alertAmount") int? alertAmount,
    @JsonKey(name: "alternaletcountryCode_1") dynamic alternaletcountryCode1,
    @JsonKey(name: "alternatePhoneNo_1") dynamic alternatePhoneNo1,
    @JsonKey(name: "alternaletcountryCode_2") dynamic alternaletcountryCode2,
    @JsonKey(name: "alternatePhoneNo_2") dynamic alternatePhoneNo2,
    @JsonKey(name: "lowBalanceAlertFlag") bool? lowBalanceAlertFlag,
    @JsonKey(name: "islowBalanceAlertSent") bool? islowBalanceAlertSent,
    @JsonKey(name: "lowBalanceAlertSentDateTime")
    dynamic lowBalanceAlertSentDateTime,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

extension LowBalanceDtoToEntity on LowBalanceDto {
  LowBalanceEntity get toEntity => LowBalanceEntity(
    responseCode:  responseCode,
    message: message,
    data: data?.toEntity
  );
}
extension LowBalanceDataDtoToEntity on Data {
  DataLowBalance get toEntity => DataLowBalance(
  customerId: customerId,
  alertAmount: alertAmount,
  alternaletcountryCode1: alternaletcountryCode1,
  alternaletcountryCode2: alternaletcountryCode2,
  alternatePhoneNo1: alternatePhoneNo1,
  alternatePhoneNo2: alternatePhoneNo2,
  lowBalanceAlertFlag: lowBalanceAlertFlag,
  lowBalanceAlertSentDateTime: lowBalanceAlertSentDateTime,
  islowBalanceAlertSent: islowBalanceAlertSent


  );
}

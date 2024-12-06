// To parse this JSON data, do
//
//     final lowBalanceAlertRequest = lowBalanceAlertRequestFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/verify_now/credits/domain/entity/low_balance_entity.dart';
import 'package:messagecentral/features/verify_now/credits/domain/repository/credits_repository.dart';

part 'get_low_balance_alert_save_usecase.g.dart';

class GetLowBalanceAlertSaveUsecase
    implements UseCase<DataState<LowBalanceEntity>, LowBalanceAlertRequest> {
  final CreditsRepository lowBalanceRepository;
  GetLowBalanceAlertSaveUsecase(this.lowBalanceRepository);

  @override
  Future<DataState<LowBalanceEntity>> call({LowBalanceAlertRequest? pramas}) {
    return lowBalanceRepository.saveLowBalanceAlertDetail(
        lowBalanceAlertRequest: pramas);
  }
}

@JsonSerializable()
class LowBalanceAlertRequest {
  @JsonKey(name: "alertAmount")
  final int? alertAmount;
  @JsonKey(name: "alternaletcountryCode_1")
  final String? alternaletcountryCode1;
  @JsonKey(name: "alternaletcountryCode_2")
  final String? alternaletcountryCode2;
  @JsonKey(name: "alternatePhoneNo_1")
  final String? alternatePhoneNo1;
  @JsonKey(name: "alternatePhoneNo_2")
  final String? alternatePhoneNo2;
  @JsonKey(name: "customerId")
  final String? customerId;
  @JsonKey(name: "lowBalanceAlertFlag")
  final bool? lowBalanceAlertFlag;

  LowBalanceAlertRequest({
    this.alertAmount,
    this.alternaletcountryCode1,
    this.alternaletcountryCode2,
    this.alternatePhoneNo1,
    this.alternatePhoneNo2,
    this.customerId,
    this.lowBalanceAlertFlag,
  });

  factory LowBalanceAlertRequest.fromJson(Map<String, dynamic> json) =>
      _$LowBalanceAlertRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LowBalanceAlertRequestToJson(this);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/details_reporting_entity.dart';

part "sms_details_reporting_state.freezed.dart";

@unfreezed
class SmsDetailsReportingState with _$SmsDetailsReportingState {
  factory SmsDetailsReportingState.initial() = _Initial;
  factory SmsDetailsReportingState.loading() = _Loading;
  factory SmsDetailsReportingState.empty() = _Empty;
  factory SmsDetailsReportingState.success(
      DetailsReportingEntity detailsReportingEntity) = _Success;
  factory SmsDetailsReportingState.error(String errorMessage) = _Error;
}

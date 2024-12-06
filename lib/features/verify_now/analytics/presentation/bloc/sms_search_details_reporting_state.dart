import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/search_details_reporting_entity.dart';

part 'sms_search_details_reporting_state.freezed.dart';

@unfreezed
class SmsSearchDetailsReportingState with _$SmsSearchDetailsReportingState {
  factory SmsSearchDetailsReportingState.initial() = _Initial;
  factory SmsSearchDetailsReportingState.loading() = _Loading;
  factory SmsSearchDetailsReportingState.empty() = _Empty;
  factory SmsSearchDetailsReportingState.success(
    DetailsReportingSearchEntity searchDetailsReportingEntity) = _Success;
  factory SmsSearchDetailsReportingState.error(String errorMessage) = _Error;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/search_details_reporting_entity.dart';

part 'otp_search_details_reporting_state.freezed.dart';

@unfreezed
class OtpSearchDetailsReportingState with _$OtpSearchDetailsReportingState {
  factory OtpSearchDetailsReportingState.initial() = _Initial;
  factory OtpSearchDetailsReportingState.loading() = _Loading;
  factory OtpSearchDetailsReportingState.empty() = _Empty;
  factory OtpSearchDetailsReportingState.success(
      DetailsReportingSearchEntity searchDetailsReportingEntity) = _Success;
  factory OtpSearchDetailsReportingState.error(String errorMessage) = _Error;
}

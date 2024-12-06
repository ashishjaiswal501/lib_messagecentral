import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/details_reporting_entity.dart';

part 'otp_details_reporting_state.freezed.dart';

@unfreezed
class OtpDetailsReportingState with _$OtpDetailsReportingState {
  factory OtpDetailsReportingState.initial() = _Initial;
  factory OtpDetailsReportingState.loading() = _Loading;
  factory OtpDetailsReportingState.empty() = _Empty;
  factory OtpDetailsReportingState.success(
      DetailsReportingEntity detailsReportingEntity) = _Success;
  factory OtpDetailsReportingState.error(String errorMessage) = _Error;
}

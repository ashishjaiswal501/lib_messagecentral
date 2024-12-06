import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/analytics_entity.dart';
part 'otp_analytics_state.freezed.dart';

@unfreezed
class OtpAnalyticsState with _$OtpAnalyticsState {
  factory OtpAnalyticsState.initial() = _Initial;
  factory OtpAnalyticsState.loading() = _Loading;
  factory OtpAnalyticsState.empty() = _Empty;
  factory OtpAnalyticsState.success(
      AnalyticsEntity analyticsEntity) = _Success;
  factory OtpAnalyticsState.error(String errorMessage) = _Error;
}

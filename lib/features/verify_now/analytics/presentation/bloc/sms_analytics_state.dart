import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/analytics_entity.dart';
part 'sms_analytics_state.freezed.dart';

@unfreezed
class SMSAnalyticsState with _$SMSAnalyticsState {
  factory SMSAnalyticsState.initial() = _Initial;
  factory SMSAnalyticsState.loading() = _Loading;
  factory SMSAnalyticsState.empty() = _Empty;
  factory SMSAnalyticsState.success(
      AnalyticsEntity analyticsEntity) = _Success;
  factory SMSAnalyticsState.error(String errorMessage) = _Error;
}

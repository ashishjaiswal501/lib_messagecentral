import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/analytics_entity.dart';

abstract class AnalyticsRepository {
  Future<DataState<AnalyticsEntity>> analytics({String? customerId, String? fromDate, String? toDate, String? authToken, String? type});
}

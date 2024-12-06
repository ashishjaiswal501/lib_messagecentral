import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/details_reporting_entity.dart';


abstract class DetailsReportingRepository {
  Future<DataState<DetailsReportingEntity>> detailsReporting({String? customerId, String? from,  String? pageNo, String? size, String? to, String? authToken, String? type});

}

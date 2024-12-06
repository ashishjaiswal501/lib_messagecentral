import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/search_details_reporting_entity.dart';


abstract class SearchDetailsReportingRepository {
  Future<DataState<DetailsReportingSearchEntity>> searchDetailedReporting({String? query,String? pageNo, String? size, String? type, String? authToken, String? customerId });

}

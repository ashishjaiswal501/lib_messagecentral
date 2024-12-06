import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/verify_now/analytics/data/dto/search_details_reporting_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'search_details_reporting_api_service.g.dart';

@RestApi()
abstract class SearchDetailsReportingApiService {
  factory SearchDetailsReportingApiService(Dio dio, {String baseUrl = ''}) =>
    _SearchDetailsReportingApiService(dio,
          baseUrl: FlavorConfig.instance!.values!.baseUrl!);

   @Header("Content-Type: application/json")
   @GET(ApiEndPoints.searchDetailedReporting)
  Future<HttpResponse<DetailsReportingSearchDto>> searchDetailedReporting(
      @Header("authToken") String authToken,
      @Query('customerId') String cutomerId,
      @Query('query') String query,
      @Query('pageNo') String pageNo,
      @Query('size') String size,
      @Query("type") String type,
      );
}

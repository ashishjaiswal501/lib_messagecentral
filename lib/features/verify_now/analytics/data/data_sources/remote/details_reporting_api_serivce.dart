import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/verify_now/analytics/data/dto/details_reporting_dto.dart';import 'package:retrofit/retrofit.dart';


part 'details_reporting_api_serivce.g.dart';


@RestApi()
abstract class DetailsReportingApiService {
  factory DetailsReportingApiService(Dio dio, {String baseUrl = ''}) =>
      _DetailsReportingApiService(dio,
          baseUrl: FlavorConfig.instance!.values!.baseUrl!);

   @Header("Content-Type: application/json")
   @POST(ApiEndPoints.detailsReporting)
  Future<HttpResponse<DetailsReportingDto>> detailsReporting(
      @Header("authToken") String authToken,
      @Query('customerId') String cutomerId,
      @Query('from') String from,
      @Query('pageNo') String pageNo,
      @Query('size') String size,
      @Query('to') String to,
      @Query("type") String type,
      );
}

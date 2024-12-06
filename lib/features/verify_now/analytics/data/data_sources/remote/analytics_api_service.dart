import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/verify_now/analytics/data/dto/analytics_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'analytics_api_service.g.dart';

@RestApi()
abstract class AnalyticsApiService {
  factory AnalyticsApiService(Dio dio, {String baseUrl = ''}) =>
      _AnalyticsApiService(dio,
          baseUrl: FlavorConfig.instance!.values!.baseUrl!);

  @Header("Content-Type: application/json")
  @GET(ApiEndPoints.analytics)
  Future<HttpResponse<AnalyticsDto>> analytics(
      @Header("authToken") String authToken,
      @Query('customerId') String cutomerId,
      @Query("type") String type,
      @Query('fromDate') String fromDate,
      @Query('toDate') String toDate);
}

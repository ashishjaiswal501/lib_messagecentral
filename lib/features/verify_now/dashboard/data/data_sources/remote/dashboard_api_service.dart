import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/verify_now/dashboard/data/dto/dashboard_otp_dto.dart';
import 'package:messagecentral/features/verify_now/dashboard/data/dto/dashboard_sms_dto.dart';
import 'package:retrofit/retrofit.dart';
part 'dashboard_api_service.g.dart';

@RestApi()
abstract class DashboardApiService {
  factory DashboardApiService(Dio dio, {String baseUrl = ''}) =>
      _DashboardApiService(dio,
          baseUrl: FlavorConfig.instance!.values!.baseUrl!);

  @Header("Content-Type: application/json")
  @GET(ApiEndPoints.analyticsVerifyNowCallOtpApi)
  Future<HttpResponse<DashboardOtpDto>> analyticsVerifyNowCallOtpApi(
      @Query("customerId") String customerId,
      @Query("fromDate") String fromDate,
     @Query("toDate") String toDate, @Header('authToken') String authToken);




  @Header("Content-Type: application/json")
  @GET(ApiEndPoints.analyticsVerifyNowCallSmsApi)
  Future<HttpResponse<DashboardSmsDto>> analyticsVerifyNowCallSmsApi(
      @Query("customerId") String customerId,
      @Query("fromDate") String fromDate,
      @Query("toDate") String toDate, @Header('authToken') String authToken);

}

import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/verify_now/credits/data/dto/low_balance_dto.dart';
import 'package:messagecentral/features/verify_now/credits/data/dto/payment_history_dto.dart';
import 'package:messagecentral/features/verify_now/credits/domain/usecases/get_low_balance_alert_save_usecase.dart';
import 'package:retrofit/retrofit.dart';

part 'credits_api_service.g.dart';

@RestApi()
abstract class CreditsApiService {
  factory CreditsApiService(Dio dio, {String baseUrl = ''}) =>
      _CreditsApiService(dio, baseUrl: FlavorConfig.instance!.values!.baseUrl!);

  @Header("Content-Type: application/json")
  @GET(ApiEndPoints.paymentHistory)
  Future<HttpResponse<PaymentHistoryDto>> paymentHistory(
      @Header("authToken") String authToken,
      @Query('customerId') String cutomerId,
      @Query('fromDate') String fromDate,
      @Query('toDate') String toDate);

  @Header("Content-Type: application/json")
  @GET(ApiEndPoints.lowBalance)
  Future<HttpResponse<LowBalanceDto>> getlowBalance(
    @Header("authToken") String authToken,
    @Query('customerId') String cutomerId,
  );

   @Header("Content-Type: application/json")
  @POST(ApiEndPoints.savelowBalanceAlertDetail)
  Future<HttpResponse<LowBalanceDto>> saveLowBalanceAlert(
    @Header("authToken") String authToken,
    @Body() LowBalanceAlertRequest? lowBalanceAlertRequest,
  );
}

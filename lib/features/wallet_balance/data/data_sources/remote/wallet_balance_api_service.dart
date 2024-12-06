import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/wallet_balance/data/dto/wallet_balance_dto.dart';
import 'package:retrofit/retrofit.dart';
part 'wallet_balance_api_service.g.dart';

@RestApi()
abstract class WalletBalanceApiService {
  factory WalletBalanceApiService(Dio dio, {String baseUrl = ''}) =>
      _WalletBalanceApiService(dio,
          baseUrl: FlavorConfig.instance!.values!.baseUrl!);



  @Header("Content-Type: application/json")
  @GET(ApiEndPoints.walletCreditsBalance)
  Future<HttpResponse<WalletBalanceDto>> walletCreditsBalance(
      @Header("authToken") String authToken,
      @Query("customerId") String customerId);

 
}

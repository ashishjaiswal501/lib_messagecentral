import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/home/data/dto/check_offer_eligibility_dto.dart';
import 'package:messagecentral/features/home/data/dto/check_offer_update_eligibility_dto.dart';


import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl = ''}) =>
      _HomeApiService(dio, baseUrl: FlavorConfig.instance!.values!.baseUrl!);

  @Header("Content-Type: application/json")
  @POST(ApiEndPoints.checkOffer)
  Future<HttpResponse<CheckOfferUpdateEligibilityDto>> updatecheckOfferEligibility(
    @Header("authToken") String authToken,
  );

  @Header("Content-Type: application/json")
  @GET(ApiEndPoints.checkoffereligibility)
  Future<HttpResponse<CheckOfferEligibilityDto>> getcheckOfferEligibility(
      @Header("authToken") String authToken, @Query("offerId") String offerId);
}

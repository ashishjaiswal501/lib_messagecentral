import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/data/dto/verify_a_user_dto.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/data/dto/verify_a_user_otp_verification_dto.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/data/dto/verify_a_user_update_brand_name_dto.dart';
import 'package:retrofit/retrofit.dart';
part 'verify_a_user_api_service.g.dart';

@RestApi()
abstract class VerifyAUserApiService {
  factory VerifyAUserApiService(Dio dio, {String baseUrl = ''}) =>
      _VerifyAUserApiService(dio,
          baseUrl: FlavorConfig.instance!.values!.baseUrl!);

  @Header(
    "Content-Type: application/json",
  )
  @POST(ApiEndPoints.verifyAUserApi)
  @MultiPart()
  Future<HttpResponse<VerifyAUserDto>> verifyAUserApi(
      @Part(name: 'flowType') String flowType,
      @Part(name: 'customerId') String customerId,
      @Part(name: 'countryCode') String countryCode,
      @Part(name: 'mobileNumber') String mobileNumber,
      @Header("authToken") String authToken);

  @Header(
    "Content-Type: application/json",
  )
  @GET(ApiEndPoints.verifyAUserOtpVerificationApi)
  Future<HttpResponse<VerifyAUserOtpVerificationDto>>
      verifyAUserOtpVerificationApi(
          @Query("code") String code,
          @Query("customerId") String customerId,
          @Query("verificationId") String verificationId,
          @Header("authToken") String authToken);


  @Header(
    "Content-Type: application/json",
  )
  @PUT(ApiEndPoints.verifyAUserUpdateBrandNameApi)
  Future<HttpResponse<VerifyAUserUpdateBrandNameDto>>
      verifyAUserUpdateBrandNameApi(
          @Query("brandName") String code,
          @Query("customerId") String customerId,
          @Header("authToken") String authToken);

}

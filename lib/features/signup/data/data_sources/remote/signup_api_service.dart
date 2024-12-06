import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/signup/data/dto/resend_otp_dto.dart';
import 'package:messagecentral/features/signup/data/dto/signup_dto.dart';
import 'package:messagecentral/features/signup/data/dto/signup_otp_dto.dart';
import 'package:messagecentral/features/signup/data/dto/signup_verify_otp_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:messagecentral/features/signup/domain/usecases/get_signup_usecase.dart';
part 'signup_api_service.g.dart';

@RestApi()
abstract class SignupAPiService {
  factory SignupAPiService(
    Dio dio, {String baseUrl=''}
  ) => _SignupAPiService(dio, baseUrl:FlavorConfig.instance!.values!.baseUrl!);

  @Header("Content-Type: application/json",)
  @POST(ApiEndPoints.signup)
  Future<HttpResponse<SignupDto>> signup(
      @Body() SignupRequestPrams signupRequestPramas);
  
   @Header("Content-Type: application/json")
  @POST(ApiEndPoints.otp)
  Future<HttpResponse<SignupOtpDto>> signUpOtp(
      @Body() Map<String,dynamic> map, 
      @Header("authToken") String authToken
      );

       @Header("Content-Type: application/json",)
  @POST(ApiEndPoints.validateOtp)
  Future<HttpResponse<SignupVerifyOtpDto>> validateOtp(
    @Body() Map<String,dynamic> map, 
      @Header("authToken") String authToken
     );


      @Header("Content-Type: application/json",)
  @GET(ApiEndPoints.resendOtp)
  
  Future<HttpResponse<ResendOtpDto>> resendOtp(
      // @Body() ResendOtpRequestPrams resendOtpRequestPrams);
      @Query("email") String email,
      @Query("phoneCode") String phoneCode,
      @Query("phoneNo") String phoneNo);
  
}



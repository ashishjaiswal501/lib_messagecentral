import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/forget_password/data/dto/confirm_password_dto.dart';
import 'package:messagecentral/features/forget_password/data/dto/forget_password_Otp_dto.dart';
import 'package:messagecentral/features/forget_password/data/dto/forget_password_email_dto.dart';
import 'package:retrofit/retrofit.dart';
part 'forget_password_api_service.g.dart';

@RestApi()
abstract class ForgetPasswordApiService {
  factory ForgetPasswordApiService(Dio dio, {String baseUrl = ''}) =>
      _ForgetPasswordApiService(dio,
          baseUrl: FlavorConfig.instance!.values!.baseUrl!);

  @Header("Content-Type: application/json")
  @GET(ApiEndPoints.forgetpasswordemail)
  Future<HttpResponse<ForgetPasswordEmailDto>> forgotPasswordwithEmail(
    @Query("email") String email,
  );

  @Header("Content-Type: application/json")
  @GET(ApiEndPoints.forgetpasswordOtp)
  Future<HttpResponse<ForgetPasswordOtpDto>> forgotPasswordwithOtp(
      @Query("email") String email,
      @Query("code") String code,
      @Query("verificationId") String verificationId);

  @Header("Content-Type: application/json")
  @POST(ApiEndPoints.resetpassword)
  @MultiPart()
  Future<HttpResponse<ConfirmPasswordDto>> forgotpasswordConfirm(
      @Part(name: 'email') String email,
      @Part(name: 'newPassword') String newPassword,
      @Header("authToken") String authToken);
}

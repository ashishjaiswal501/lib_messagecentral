import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/account_details/data/dto/update_phone_number_dto.dart';
import 'package:messagecentral/features/account_details/domain/usecases/get_account_details_usecase.dart';
import 'package:messagecentral/features/find_by_customer_id/data/dto/find_by_customer_id_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'user_account_detail_api_service.g.dart';

@RestApi()
abstract class UserAccountDetailsApiService {
  factory UserAccountDetailsApiService(Dio dio, {String baseUrl = ''}) =>
      _UserAccountDetailsApiService(dio,
          baseUrl: FlavorConfig.instance!.values!.baseUrl!);

  @Header("Content-Type: application/json")
  @PUT(ApiEndPoints.updatePassword)
  Future<HttpResponse<FindByCustomerIdDto>> updatePassword(
      @Header("authToken") String authToken,
      @Query("customerId") String customerId,
      @Query("newPassword") String newPassword,
      @Query('oldPassword') String oldPassword);

  @Header("Content-Type: application/json")
  @GET(ApiEndPoints.updatePhoneOtp)
  Future<HttpResponse<UpdatePhoneNumberDto>> updatePhoneGetOtp(
    @Header("authToken") String authToken,
    @Query("phoneCode") String phoneCode,
    @Query("phoneNo") String phoneNo,
  );

  @Header("Content-Type: application/json")
  @PUT(ApiEndPoints.updatePhone)
  Future<HttpResponse<UpdatePhoneNumberDto>> updatePhoneNo(
    @Header("authToken") String authToken,
    @Query("phoneCode") String phoneCode,
    @Query("phoneNo") String phoneNo,
    @Query("customerId") String customerId,
    @Query("verificationId") String verificationId,
    @Query("code") String otp,
  );

  @Header("Content-Type: application/json")
  @PUT(ApiEndPoints.updateUserAccount)
  Future<HttpResponse<FindByCustomerIdDto>> updateAccountDetails(
      @Header("authToken") String authToken,
      @Body() AccountDetailsRequest accountDetailsRequest);
}

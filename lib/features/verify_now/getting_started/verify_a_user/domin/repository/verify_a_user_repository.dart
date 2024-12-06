import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_enity.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_otp_verification_entity.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_update_brand_name_entity.dart';

abstract class VerifyAUserRepository {
  Future<DataState<VerifyAUserEntity>> verifyAUserApi(
      {required String flowType,
      required String customerId,
      required String countryCode,
      required String mobileNumber,
      required String authToken});

  Future<DataState<VerifyAUserOtpVerificationEntity>>
      verifyAUserOtpVerificationApi(
          {required String code,
          required String customerId,
          required String verificationId,
          required String authToken,
          
          });


           Future<DataState<VerifyAUserUpdateBrandNameEntity>>
      verifyAUserUpdateBrandNameApi(
          {required String brandName,
          required String customerId,
          required String authToken,
          
          });
}


import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/signup/domain/entity/resend_otp_enity.dart';
import 'package:messagecentral/features/signup/domain/entity/signup_enity.dart';
import 'package:messagecentral/features/signup/domain/entity/signup_otp_enity.dart';
import 'package:messagecentral/features/signup/domain/entity/signup_verify_otp_enity.dart';
import 'package:messagecentral/features/signup/domain/usecases/get_signup_usecase.dart';


abstract class SignupRepository {
  Future<DataState<SignupEntity>> signup({required SignupRequestPrams signupRequestPrams});
  Future<DataState<SignupOtpEntity>> signUpOtp({required String customId, required String phoneNumber,  required String countryCode, required String authToken});
  Future<DataState<SignupVerifyOtpEntity>> validateOtp({required String customerId, required String otpVerificationId,  required String otp, required String authToken});
  Future<DataState<ResendOtpEntity>> resendOtp({required String email,required String phoneNo,required String phoneCode});
}
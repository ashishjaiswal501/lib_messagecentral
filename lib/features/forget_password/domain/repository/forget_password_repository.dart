

import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/forget_password/domain/entity/confirm_password_entity.dart';
import 'package:messagecentral/features/forget_password/domain/entity/forget_password_email_entity.dart';
import 'package:messagecentral/features/forget_password/domain/entity/forget_password_otp_entity.dart';


abstract class ForgetPasswordRepository {
  Future<DataState<ForgetPasswordEmailEntity>> forgetPasswordWithEmail(
      {required String email});
  Future<DataState<ForgetPasswordOtpEntity>> forgetPasswordWithOtp(
      {required String email,
      required String code,
      required String verificationId});

  Future<DataState<ConfirmPasswordEntity>> forgetConfirmPaasword( {required String email, required String newPassword, required String authToken});
}

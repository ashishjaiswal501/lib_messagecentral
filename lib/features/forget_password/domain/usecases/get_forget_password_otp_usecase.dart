
import 'package:messagecentral/features/forget_password/domain/entity/forget_password_otp_entity.dart';
import 'package:messagecentral/features/forget_password/domain/repository/forget_password_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';

class GetForgetPasswordOtpUsecase
    implements UseCase<DataState<ForgetPasswordOtpEntity>, ForgetPasswordOtpRequestPrams> {
  final ForgetPasswordRepository forgetPasswordRepository;
  GetForgetPasswordOtpUsecase({required this.forgetPasswordRepository});

  @override
  Future<DataState<ForgetPasswordOtpEntity>> call({ForgetPasswordOtpRequestPrams? pramas}) {
   return forgetPasswordRepository.forgetPasswordWithOtp(email: pramas!.email!, code: pramas.code!, verificationId: pramas.verificationId!);
  }
}

class ForgetPasswordOtpRequestPrams {
  String? email;
  String? code;
  String? verificationId;

  ForgetPasswordOtpRequestPrams(
      {this.email = '', this.code = '', this.verificationId = ''});
}

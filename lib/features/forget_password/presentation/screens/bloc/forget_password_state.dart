import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/forget_password/domain/entity/confirm_password_entity.dart';
import 'package:messagecentral/features/forget_password/domain/entity/forget_password_email_entity.dart';


abstract class ForgetPasswordState extends Equatable {
  final ForgetPasswordEmailEntity? forgetEmailEntity;
  //final ForgetPasswordOtpEntity? forgetOtpEntity;
  final ConfirmPasswordEntity? confirmPasswordEntity;
  final String? dioError;
  final bool? isvisibleEmailOtp;

  const ForgetPasswordState({
    this.isvisibleEmailOtp = true,
    this.dioError,
    this.forgetEmailEntity,
   // this.forgetOtpEntity,
    this.confirmPasswordEntity,
  });

  @override
  List<Object?> get props => [
        isvisibleEmailOtp,
        dioError,
        forgetEmailEntity,
       // forgetOtpEntity,
        confirmPasswordEntity
      ];
}

class ForgetPasswordStateInitial extends ForgetPasswordState {
  const ForgetPasswordStateInitial();
}

class ForgetPasswordStateLoading extends ForgetPasswordState {
  const ForgetPasswordStateLoading();
}
class ForgetPasswordConfirmStateLoading extends ForgetPasswordState {
  const ForgetPasswordConfirmStateLoading();
}

class ForgetPasswordStateEmailSuccess extends ForgetPasswordState {
  const ForgetPasswordStateEmailSuccess(
    ForgetPasswordEmailEntity emailEntity,
  ) : super(forgetEmailEntity: emailEntity);
}

// class ForgetPasswordStateOtpSuccess extends ForgetPasswordState {
//   const ForgetPasswordStateOtpSuccess(
//     ForgetPasswordOtpEntity otpEntity,
//   ) : super(forgetOtpEntity: otpEntity);
// }

class ConfirmPasswordStateSuccess extends ForgetPasswordState {
  const ConfirmPasswordStateSuccess(
    ConfirmPasswordEntity confirmPasswordEntity,
  ) : super(confirmPasswordEntity: confirmPasswordEntity);
}

class FOrgetPasswordEmailStateError extends ForgetPasswordState {
  const FOrgetPasswordEmailStateError(String dioError)
      : super(dioError: dioError);
}

class FOrgetPasswordOtpStateError extends ForgetPasswordState {
  const FOrgetPasswordOtpStateError(String dioError)
      : super(dioError: dioError);
}

class ForgetPasswordVisibilityState extends ForgetPasswordState {
  const ForgetPasswordVisibilityState(bool isvisibleEmailOtp)
      : super(isvisibleEmailOtp: isvisibleEmailOtp);
}

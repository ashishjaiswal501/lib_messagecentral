import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/forget_password/domain/entity/forget_password_otp_entity.dart';

abstract class ForgetPasswordOtpState extends Equatable {

  final ForgetPasswordOtpEntity? forgetOtpEntity;
  
  final String? dioError;


  const ForgetPasswordOtpState({
   
    this.dioError,
  
    this.forgetOtpEntity,
  
  });

  @override
  List<Object?> get props => [
       
        dioError,
       
        forgetOtpEntity,
       
      ];
}

class ForgetPasswordOtpStateInitial extends ForgetPasswordOtpState {
  const ForgetPasswordOtpStateInitial();
}

class ForgetPasswordOtpStateLoading extends ForgetPasswordOtpState {
  const ForgetPasswordOtpStateLoading();
}





class ForgetPasswordStateOtpSuccess extends ForgetPasswordOtpState {
  const ForgetPasswordStateOtpSuccess(
    ForgetPasswordOtpEntity otpEntity,
  ) : super(forgetOtpEntity: otpEntity);
}




class ForgetPasswordOtpStateError extends ForgetPasswordOtpState {
  const ForgetPasswordOtpStateError(String dioError)
      : super(dioError: dioError);
}



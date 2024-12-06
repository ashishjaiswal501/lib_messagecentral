import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/signup/domain/entity/resend_otp_enity.dart';

class ResendOtpState extends Equatable {
  final ResendOtpEntity? resendOtpEntity;
  final String? dioError;

 const ResendOtpState({this.resendOtpEntity, this.dioError});
  @override
  List<Object?> get props => [];
}

class ResendOtpStateLoading extends ResendOtpState {
  const ResendOtpStateLoading();
}

class ResendOtpStateInitial extends ResendOtpState {
  const ResendOtpStateInitial();
}

class ResendOtpStateError extends ResendOtpState {
  const ResendOtpStateError(String dioError) : super(dioError: dioError);
}

class ResendOtpStateSuccess extends ResendOtpState {
  const ResendOtpStateSuccess(ResendOtpEntity resendOtpEntity)
      : super(
            resendOtpEntity: resendOtpEntity,
           );
}

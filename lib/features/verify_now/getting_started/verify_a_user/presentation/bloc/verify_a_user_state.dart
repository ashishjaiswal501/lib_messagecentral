import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_enity.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_otp_verification_entity.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_update_brand_name_entity.dart';

abstract class VerifyAUserState extends Equatable {
  final VerifyAUserEntity? verifyAUserEntity;

  final VerifyAUserOtpVerificationEntity? verifyAUserOtpVerificationEntity;
  final VerifyAUserUpdateBrandNameEntity? verifyAUserUpdateBrandNameEntity;

  final String? dioError;
  final bool isVerifySuccess;
  final bool isVerifyOtpVerificationSuccess;
  final bool isVerifyAUserUpdateBrandNameSuccess;

  const VerifyAUserState(
      {this.verifyAUserEntity,
      this.verifyAUserOtpVerificationEntity,
      this.verifyAUserUpdateBrandNameEntity,
      this.dioError,
      this.isVerifySuccess = false,
      this.isVerifyOtpVerificationSuccess = false,
      this.isVerifyAUserUpdateBrandNameSuccess = false});

  @override
  List<Object?> get props => [
        verifyAUserEntity,
        verifyAUserOtpVerificationEntity,
        verifyAUserUpdateBrandNameEntity,
        dioError
      ];
}

class VerifyAUserStateInitial extends VerifyAUserState {
  const VerifyAUserStateInitial()
      : super(
          isVerifySuccess: false,
        );
}

class BacktoPreviousStateInitial extends VerifyAUserState {
  const BacktoPreviousStateInitial()
      : super(
          isVerifySuccess: false,
        );
}

class VerifyAUserStateLoading extends VerifyAUserState {
  const VerifyAUserStateLoading()
      : super(
          isVerifySuccess: false,
        );
}

class VerifyAUserStateSuccess extends VerifyAUserState {
  const VerifyAUserStateSuccess(VerifyAUserEntity verifyAUserEntity)
      : super(
          verifyAUserEntity: verifyAUserEntity,
          isVerifySuccess: true,
        );
}

class VerifyAUserStateError extends VerifyAUserState {
  const VerifyAUserStateError(String dioError)
      : super(
          dioError: dioError,
          isVerifySuccess: true,
        );
}

class VerifyAUserOtpVerificationStateInitial extends VerifyAUserState {
  const VerifyAUserOtpVerificationStateInitial()
      : super(
          isVerifyOtpVerificationSuccess: false,
        );
}

class BacktoPreviousOtpVerificationStateInitial extends VerifyAUserState {
  const BacktoPreviousOtpVerificationStateInitial()
      : super(
          isVerifyOtpVerificationSuccess: false,
        );
}

class VerifyAUserOtpVerificationStateLoading extends VerifyAUserState {
  const VerifyAUserOtpVerificationStateLoading()
      : super(
          isVerifyOtpVerificationSuccess: false,
        );
}

class VerifyAUserOtpVerificationStateSuccess extends VerifyAUserState {
  const VerifyAUserOtpVerificationStateSuccess(
      VerifyAUserOtpVerificationEntity verifyAUserOtpVerificationEntity)
      : super(
          verifyAUserOtpVerificationEntity: verifyAUserOtpVerificationEntity,
          isVerifyOtpVerificationSuccess: true,
        );
}

class VerifyAUserOtpVerificationStateError extends VerifyAUserState {
  const VerifyAUserOtpVerificationStateError(String dioError)
      : super(
          dioError: dioError,
          isVerifyOtpVerificationSuccess: false,
        );
}

/// States for brand change.

class VerifyAUserUpdateBrandNameStateInitial extends VerifyAUserState {
  const VerifyAUserUpdateBrandNameStateInitial()
      : super(
          isVerifyAUserUpdateBrandNameSuccess: false,
        );
}

class VerifyAUserUpdateBrandNameStateLoading extends VerifyAUserState {
  const VerifyAUserUpdateBrandNameStateLoading()
      : super(
          isVerifyAUserUpdateBrandNameSuccess: false,
        );
}

class VerifyAUserUpdateBrandNameStateSuccesss extends VerifyAUserState {
  const VerifyAUserUpdateBrandNameStateSuccesss(
      VerifyAUserUpdateBrandNameEntity verifyAUserUpdateBrandNameEntity)
      : super(
          verifyAUserUpdateBrandNameEntity: verifyAUserUpdateBrandNameEntity,
          isVerifyAUserUpdateBrandNameSuccess: true,
        );
}

class VerifyAUserUpdateBrandNameStateError extends VerifyAUserState {
  const VerifyAUserUpdateBrandNameStateError(String dioError)
      : super(
          dioError: dioError,
          isVerifyAUserUpdateBrandNameSuccess: false,
        );
}

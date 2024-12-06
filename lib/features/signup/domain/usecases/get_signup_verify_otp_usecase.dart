

// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/signup/domain/entity/signup_verify_otp_enity.dart';
import 'package:messagecentral/features/signup/domain/repository/signup_repository.dart';
 part 'get_signup_verify_otp_usecase.g.dart';
 
class GetSignupVerifyOtpUsecase implements UseCase<DataState<SignupVerifyOtpEntity>, SignupVerifyOtpRequestPrams> {
final SignupRepository signupRepository;
GetSignupVerifyOtpUsecase(this.signupRepository);

  @override
  Future<DataState<SignupVerifyOtpEntity>> call({SignupVerifyOtpRequestPrams? pramas}) {
       return signupRepository.validateOtp(otpVerificationId: pramas!.otpVerificationId, otp: pramas.otp, authToken: pramas.authToken, customerId: pramas.customerId);
  }
}


@JsonSerializable()
class SignupVerifyOtpRequestPrams{
 
  String otp;
  String customerId;
  String otpVerificationId;
  String authToken;

SignupVerifyOtpRequestPrams({ this.customerId='',this.otp='', this.otpVerificationId='',this.authToken=''});

 factory SignupVerifyOtpRequestPrams.fromJson(Map<String, dynamic> json) => _$SignupVerifyOtpRequestPramsFromJson(json);

 // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SignupVerifyOtpRequestPramsToJson(this);
}
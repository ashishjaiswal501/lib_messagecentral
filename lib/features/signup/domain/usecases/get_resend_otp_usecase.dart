

// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/signup/domain/entity/resend_otp_enity.dart';
import 'package:messagecentral/features/signup/domain/repository/signup_repository.dart';
 part 'get_resend_otp_usecase.g.dart';
 
class GetResendOtpUsecase implements UseCase<DataState<ResendOtpEntity>, ResendOtpRequestPrams> {
final SignupRepository signupRepository;
GetResendOtpUsecase(this.signupRepository);

  @override
  Future<DataState<ResendOtpEntity>> call({ResendOtpRequestPrams? pramas}) {
   return signupRepository.resendOtp(email: pramas!.email, phoneNo: pramas.phoneNo,phoneCode: pramas.phoneCode);
  }
}


@JsonSerializable()
class ResendOtpRequestPrams{
 
  String email;
  String phoneCode;
  String phoneNo;

ResendOtpRequestPrams({ this.email='',this.phoneCode='', this.phoneNo=''});

 factory ResendOtpRequestPrams.fromJson(Map<String, dynamic> json) => _$ResendOtpRequestPramsFromJson(json);

 // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ResendOtpRequestPramsToJson(this);
}
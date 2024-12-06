

// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/signup/domain/entity/signup_otp_enity.dart';

import 'package:messagecentral/features/signup/domain/repository/signup_repository.dart';
 part 'get_signup_otp_usecase.g.dart';
 
class GetSignupOtpUsecase implements UseCase<DataState<SignupOtpEntity>, SignupOtpRequestPrams> {
final SignupRepository signupRepository;
GetSignupOtpUsecase(this.signupRepository);

  @override
  Future<DataState<SignupOtpEntity>> call({SignupOtpRequestPrams? pramas}) {
   return signupRepository.signUpOtp(countryCode: pramas!.countryCode, phoneNumber: pramas.phoneNo, authToken: pramas.authToken, customId: pramas.customerId);
  }
}


@JsonSerializable()
class SignupOtpRequestPrams{
 
  String countryCode;
  String customerId;
  String phoneNo;
  String authToken;


SignupOtpRequestPrams({ this.countryCode='',this.customerId='', this.phoneNo='', this.authToken=''});
// token({ this.token});

 factory SignupOtpRequestPrams.fromJson(Map<String, dynamic> json) => _$SignupOtpRequestPramsFromJson(json);

 // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SignupOtpRequestPramsToJson(this);
}
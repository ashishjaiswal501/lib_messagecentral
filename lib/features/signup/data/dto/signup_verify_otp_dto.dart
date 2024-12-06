
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:messagecentral/features/signup/domain/entity/signup_verify_otp_enity.dart';

part 'signup_verify_otp_dto.freezed.dart';
part 'signup_verify_otp_dto.g.dart';

@freezed
class SignupVerifyOtpDto with _$SignupVerifyOtpDto {
    const factory SignupVerifyOtpDto({
        @JsonKey(name: "responseCode")
        int? responseCode,
        @JsonKey(name: "message")
        String? message,
        @JsonKey(name: "data")
        Data? data,
    }) = _SignupVerifyOtpDto;

    factory SignupVerifyOtpDto.fromJson(Map<String, dynamic> json) => _$SignupVerifyOtpDtoFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        @JsonKey(name: "authToken")
        String? authToken,
        @JsonKey(name: "customerId")
        String? customerId,
        @JsonKey(name: "accountStatus")
        String? accountStatus,
        @JsonKey(name: "countryCode")
        String? countryCode,
        @JsonKey(name: "mobileNumber")
        String? mobileNumber,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}


// toentity
extension SignupEntityExtension on SignupVerifyOtpDto {
  SignupVerifyOtpEntity get signupVerifyToEntity => SignupVerifyOtpEntity(
      responseCode: responseCode, message: message, userData: data?.toEntity());
}

extension UserDataEntityExtention on Data {
  UserData toEntity() {
    return UserData( 
      authToken:authToken,
      accountStatus: accountStatus,      
       customerId: customerId,
       countryCode:countryCode,
       mobileNumber:mobileNumber

    );
  }
}


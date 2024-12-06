// To parse this JSON data, do
//
//     final loginResponseDto = loginResponseDtoFromJson(jsonString);

// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/login/domain/entity/login_enity.dart';

part 'login_dto.freezed.dart';
part 'login_dto.g.dart';

@freezed
class LoginDto with _$LoginDto {
  const factory LoginDto({
    @JsonKey(name: "responseCode") int? responseCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _LoginDto;

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "authToken") String? authToken,
    @JsonKey(name: "tempToken") String? tempToken,
    @JsonKey(name: "customerId") String? customerId,
    @JsonKey(name: "accountStatus") String? accountStatus,
    @JsonKey(name: "countryStatus") String? countryStatus,
    @JsonKey(name: "countryCode") String? countryCode,
    @JsonKey(name: "phoneNo") String? phoneNo,
    @JsonKey(name: "mobileNumberAvailable") String? mobileNumberAvailable,
    @JsonKey(name: "firstName") String? firstName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "otpVerification") bool? otpVerification,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

// toentity
extension LoginEntityExtension on LoginDto {
  LoginEntity get toEntity => LoginEntity(
      responseCode: responseCode, message: message, userData: data?.toEntity());
}

extension UserDataEntityExtention on Data {
  UserData toEntity() {
    return UserData(
      authToken: authToken,
      tempToken: tempToken ?? "",
      customerId: customerId,
      accountStatus: accountStatus,
      countryStatus: countryStatus,
      countryCode: countryCode,
      phoneNo: phoneNo,
      mobileNumberAvailable: mobileNumberAvailable,
      firstName: firstName,
      email: email,
      otpVerification: otpVerification,
    );
  }
}

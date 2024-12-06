// To parse this JSON data, do
//
//     final signupDto = signupDtoFromJson(jsonString);
import 'package:messagecentral/features/signup/domain/entity/signup_enity.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_dto.freezed.dart';
part 'signup_dto.g.dart';

@freezed
class SignupDto with _$SignupDto {
  const factory SignupDto({
    @JsonKey(name: "responseCode") int? responseCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _SignupDto;

  factory SignupDto.fromJson(Map<String, dynamic> json) =>
      _$SignupDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "tempToken") String? tempToken,
    @JsonKey(name: "customerId") String? customerId,
    @JsonKey(name: "email") String? email,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

// toentity
extension SignupEntityExtension on SignupDto {
  SignupEntity get toEntity => SignupEntity(
      responseCode: responseCode, message: message, userData: data?.toEntity());
}

extension UserDataEntityExtention on Data {
  UserData toEntity() {
    return UserData(
      tempToken: tempToken,
      customerId: customerId,
      email: email,
    );
  }
}

// To parse this JSON data, do
//
//     final verifyAUserDto = verifyAUserDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_enity.dart';


part 'verify_a_user_dto.freezed.dart';
part 'verify_a_user_dto.g.dart';

@freezed
class VerifyAUserDto with _$VerifyAUserDto {
    const factory VerifyAUserDto({
        @JsonKey(name: "responseCode")
        int? responseCode,
        @JsonKey(name: "message")
        String? message,
        @JsonKey(name: "data")
        Data? data,
    }) = _VerifyAUserDto;

    factory VerifyAUserDto.fromJson(Map<String, dynamic> json) => _$VerifyAUserDtoFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        @JsonKey(name: "verificationId")
        String? verificationId,
        @JsonKey(name: "mobileNumber")
        String? mobileNumber,
        @JsonKey(name: "responseCode")
        String? responseCode,
        @JsonKey(name: "errorMessage")
        dynamic errorMessage,
        @JsonKey(name: "timeout")
        String? timeout,
        @JsonKey(name: "smsCLI")
        dynamic smsCli,
        @JsonKey(name: "transactionId")
        dynamic transactionId,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}


// toentity
extension VerifyAUserEntityExtension on VerifyAUserDto {
  VerifyAUserEntity get toEntity => VerifyAUserEntity(
      responseCode: responseCode, message: message, userData: data?.toEntity());
}

extension UserDataEntityExtention on Data {
  UserData toEntity() {
    return UserData(
      verificationId: verificationId,
      mobileNumber: mobileNumber,
      responseCode: responseCode,
      errorMessage: errorMessage,
      timeout: timeout,
      smsCli: smsCli,
      transactionId:transactionId,
    );
  }
}
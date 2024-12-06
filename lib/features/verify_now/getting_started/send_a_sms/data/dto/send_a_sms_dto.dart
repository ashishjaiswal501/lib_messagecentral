// To parse this JSON data, do
//
//     final sendASmsDto = sendASmsDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';


import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/entity/send_a_sms_enity.dart';

part 'send_a_sms_dto.freezed.dart';
part 'send_a_sms_dto.g.dart';

@freezed
class SendASmsDto with _$SendASmsDto {
  const factory SendASmsDto({
    @JsonKey(name: "responseCode") int? responseCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _SendASmsDto;

  factory SendASmsDto.fromJson(Map<String, dynamic> json) =>
      _$SendASmsDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "verificationId") String? verificationId,
    @JsonKey(name: "mobileNumber") String? mobileNumber,
    @JsonKey(name: "responseCode") String? responseCode,
    @JsonKey(name: "errorMessage") dynamic errorMessage,
    @JsonKey(name: "timeout") String? timeout,
    @JsonKey(name: "smsCLI") dynamic smsCli,
    @JsonKey(name: "transactionId") dynamic transactionId,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

// toentity
extension SendASmsEntityExtension on SendASmsDto {
  SendASmsEntity get toEntity => SendASmsEntity(
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
      smsCLI: smsCli,
      transactionId: transactionId,
    );
  }
}

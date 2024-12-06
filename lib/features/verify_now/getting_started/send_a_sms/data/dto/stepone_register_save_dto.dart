// To parse this JSON data, do
//
//     final steponeRegisterSaveDto = steponeRegisterSaveDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/entity/stepone_register_save_entity.dart';

part 'stepone_register_save_dto.freezed.dart';
part 'stepone_register_save_dto.g.dart';

@freezed
class SteponeRegisterSaveDto with _$SteponeRegisterSaveDto {
  const factory SteponeRegisterSaveDto({
    @JsonKey(name: "responseCode") int? responseCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _SteponeRegisterSaveDto;

  factory SteponeRegisterSaveDto.fromJson(Map<String, dynamic> json) =>
      _$SteponeRegisterSaveDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "userName") String? userName,
    @JsonKey(name: "companyName") String? companyName,
    @JsonKey(name: "companyWebsite") String? companyWebsite,
    @JsonKey(name: "workingEmail") String? workingEmail,
    @JsonKey(name: "contactNumber") String? contactNumber,
    @JsonKey(name: "countryToSendSMS") String? countryToSendSms,
    @JsonKey(name: "hasIndianRegisteredSenderID")
    bool? hasIndianRegisteredSenderId,
    @JsonKey(name: "usageDescription") String? usageDescription,
    @JsonKey(name: "userAccountType") String? userAccountType,
    @JsonKey(name: "userAddress") String? userAddress,
    @JsonKey(name: "userCountry") String? userCountry,
    @JsonKey(name: "userCity") String? userCity,
    @JsonKey(name: "userState") String? userState,
    @JsonKey(name: "userZipCode") int? userZipCode,
    @JsonKey(name: "resellerType") bool? resellerType,
    @JsonKey(name: "customerId") String? customerId,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

extension SteponeRegisterSaveEntityExtension on SteponeRegisterSaveDto {
  SteponeRegisterSaveEntity get toEntity => SteponeRegisterSaveEntity(
      responseCode: responseCode,
      message: message,
      registerData: data?.toEntity());
}

extension UserDataEntityExtention on Data {
  RegisterData toEntity() {
    return RegisterData(
        userName: userName,
        companyName: companyName,
        companyWebsite: companyWebsite,
        workingEmail: workingEmail,
        contactNumber: contactNumber,
        countryToSendSms: countryToSendSms,
        hasIndianRegisteredSenderId: hasIndianRegisteredSenderId,
        usageDescription: usageDescription,
        userAccountType: userAccountType,
        resellerType: resellerType,
        userAddress: userAddress,
        userCountry: userCountry,
        customerId: customerId,
        userCity: userCity,
        userState: userState,
        userZipCode: userZipCode);
  }
}

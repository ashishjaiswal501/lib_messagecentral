// To parse this JSON data, do
//
//     final confirmPasswordDto = confirmPasswordDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';


import 'package:messagecentral/features/forget_password/domain/entity/confirm_password_entity.dart';

part 'confirm_password_dto.freezed.dart';
part 'confirm_password_dto.g.dart';

@freezed
class ConfirmPasswordDto with _$ConfirmPasswordDto {
  const factory ConfirmPasswordDto({
    @JsonKey(name: "responseCode") int? responseCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _ConfirmPasswordDto;

  factory ConfirmPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ConfirmPasswordDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "customerId") String? customerId,
    @JsonKey(name: "firstName") String? firstName,
    @JsonKey(name: "lastName") dynamic lastName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "password") String? password,
    @JsonKey(name: "phoneCode") String? phoneCode,
    @JsonKey(name: "phoneNo") String? phoneNo,
    @JsonKey(name: "application") dynamic application,
    @JsonKey(name: "wallet") dynamic wallet,
    @JsonKey(name: "authToken") dynamic authToken,
    @JsonKey(name: "createdDateTime") DateTime? createdDateTime,
    @JsonKey(name: "updatedDateTime") dynamic updatedDateTime,
    @JsonKey(name: "address") dynamic address,
    @JsonKey(name: "city") dynamic city,
    @JsonKey(name: "state") dynamic state,
    @JsonKey(name: "postalCode") dynamic postalCode,
    @JsonKey(name: "country") dynamic country,
    @JsonKey(name: "newUser") bool? newUser,
    @JsonKey(name: "brandName") String? brandName,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

extension ConfirmPasswordEntityExtension on ConfirmPasswordDto {
  ConfirmPasswordEntity get toEntity => ConfirmPasswordEntity(
        responseCode: responseCode,
        message: message,
        data: data?.toEntity(),
      );
}

extension ConfirmPasswordUserDataEntityExtention on Data {
  ConfirmPaasswordData toEntity() {
    return ConfirmPaasswordData(
        customerId: customerId,
        firstName: firstName,
        email: email,
        password: password,
        phoneCode: phoneCode,
        phoneNo: phoneNo,
        application: application,
        wallet: wallet,
        authToken: authToken,
        createdDateTime: createdDateTime,
        updatedDateTime: updatedDateTime,
        address: address,
        city: city,
        newUser: newUser,
        country: country,
        postalCode: postalCode);
  }
}

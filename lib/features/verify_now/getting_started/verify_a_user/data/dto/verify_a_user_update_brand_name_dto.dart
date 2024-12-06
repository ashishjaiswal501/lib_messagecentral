// To parse this JSON data, do
//
//     final verifyAUserUpdateBrandNameDto = verifyAUserUpdateBrandNameDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_update_brand_name_entity.dart';

part 'verify_a_user_update_brand_name_dto.freezed.dart';
part 'verify_a_user_update_brand_name_dto.g.dart';

@freezed
class VerifyAUserUpdateBrandNameDto with _$VerifyAUserUpdateBrandNameDto {
  const factory VerifyAUserUpdateBrandNameDto({
    @JsonKey(name: "responseCode") int? responseCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") dynamic data,
  }) = _VerifyAUserUpdateBrandNameDto;

  factory VerifyAUserUpdateBrandNameDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyAUserUpdateBrandNameDtoFromJson(json);
}

// toentity
extension VerifyAUserUpdateBrandNameEntityExtension
    on VerifyAUserUpdateBrandNameDto {
  VerifyAUserUpdateBrandNameEntity get toEntity =>
      VerifyAUserUpdateBrandNameEntity(
          responseCode: responseCode, message: message, userData: null);
}


// toentity
// extension VerifyAUserEntityExtension on VerifyAUserDto {
//   VerifyAUserEntity get toEntity => VerifyAUserEntity(
//       responseCode: responseCode, message: message, userData: data?.toEntity());
// }

// extension UserDataEntityExtention on Data {
//   UserData toEntity() {
//     return UserData(
//       verificationId: verificationId,
//       mobileNumber: mobileNumber,
//       responseCode: responseCode,
//       errorMessage: errorMessage,
//       timeout: timeout,
//       smsCli: smsCli,
//       transactionId:transactionId,
//     );
//   }
// }
import 'package:freezed_annotation/freezed_annotation.dart';
part 'verify_a_user_update_brand_name_entity.freezed.dart';

@freezed
class VerifyAUserUpdateBrandNameEntity with _$VerifyAUserUpdateBrandNameEntity {
  const factory VerifyAUserUpdateBrandNameEntity({
    int? responseCode,
    String? message,
    UserData? userData,
  }) = _VerifyAUserUpdateBrandNameEntity;
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    String? data,
   
  }) = _UserData;

}
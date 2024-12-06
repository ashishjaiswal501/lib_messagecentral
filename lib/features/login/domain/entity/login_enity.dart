import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_enity.freezed.dart';

@freezed
class LoginEntity with _$LoginEntity {
  const factory LoginEntity({
    int? responseCode,
    String? message,
    UserData? userData,
  }) = _LoginEntity;
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    String? authToken,
    String? tempToken,
    String? customerId,
    String? accountStatus,
    String? countryStatus,
    String? countryCode,
    String? phoneNo,
    String? mobileNumberAvailable,
    String? firstName,
    String? email,
    bool? otpVerification,
  }) = _UserData;

 
}



import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_enity.freezed.dart';

@freezed
class SignupEntity with _$SignupEntity {
  const factory SignupEntity({
    int? responseCode,
    String? message,
    UserData? userData,
  }) = _SignupEntity;
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    String? tempToken,
    String? customerId,
    String? email,
  }) = _UserData;

 
}



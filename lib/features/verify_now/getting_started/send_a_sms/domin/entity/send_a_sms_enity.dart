import 'package:freezed_annotation/freezed_annotation.dart';
part 'send_a_sms_enity.freezed.dart';


@freezed
class SendASmsEntity with _$SendASmsEntity {
  const factory SendASmsEntity({
    int? responseCode,
    String? message,
    UserData? userData,
  }) = _SendASmsEntity;
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    String? verificationId,
    String? mobileNumber,
    String? responseCode,
    String? errorMessage,
    String? timeout,
    String? smsCLI,
    String? transactionId,
  }) = _UserData;
}

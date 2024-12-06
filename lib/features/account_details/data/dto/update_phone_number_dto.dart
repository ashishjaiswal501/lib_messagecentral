

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/account_details/domain/enitity/update_phone_number_entity.dart';


part 'update_phone_number_dto.freezed.dart';
part 'update_phone_number_dto.g.dart';



@freezed
class UpdatePhoneNumberDto with _$UpdatePhoneNumberDto {
    const factory UpdatePhoneNumberDto({
        @JsonKey(name: "responseCode")
        int? responseCode,
        @JsonKey(name: "message")
        String? message,
        @JsonKey(name: "data")
        Data? data,
    }) = _UpdatePhoneNumberDto;

    factory UpdatePhoneNumberDto.fromJson(Map<String, dynamic> json) => _$UpdatePhoneNumberDtoFromJson(json);
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
        @JsonKey(name: "newUser")
        bool? newUser,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}


extension UpdatePhoneNumberEntityExtension on UpdatePhoneNumberDto {
  UpdatePhoneNumberEntity get toEntity => UpdatePhoneNumberEntity(
      responseCode: responseCode,
      message: message,
      phoneData: data?.toEntity());
}



extension PhoneDataEntityExtention on Data {
  PhoneData toEntity() {
    return PhoneData(
     verificationId: verificationId,
     mobileNumber: mobileNumber,
     responseCode: responseCode,
     errorMessage: errorMessage,
     timeout: timeout,
     smsCli: smsCli,
     transactionId: transactionId,
     newUser: newUser
    );
  }
}

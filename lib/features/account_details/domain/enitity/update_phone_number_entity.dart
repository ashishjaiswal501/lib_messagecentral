// To parse this JSON data, do
//
//     final updatePhoneNumberEntity = updatePhoneNumberEntityFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';


part 'update_phone_number_entity.freezed.dart';



@freezed
class UpdatePhoneNumberEntity with _$UpdatePhoneNumberEntity {
    const factory UpdatePhoneNumberEntity({
        int? responseCode,
        String? message,
        PhoneData? phoneData,
    }) = _UpdatePhoneNumberEntity;

    
}

@freezed
class PhoneData with _$PhoneData {
    const factory PhoneData({
        String? verificationId,
        String? mobileNumber,
        String? responseCode,
        dynamic errorMessage,
        String? timeout,
        dynamic smsCli,
        dynamic transactionId,
        bool? newUser,
    }) = _PhoneData;

   
}

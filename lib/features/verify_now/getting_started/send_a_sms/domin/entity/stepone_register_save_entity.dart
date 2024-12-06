// To parse this JSON data, do
//
//     final steponeRegisterSaveEntity = steponeRegisterSaveEntityFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';


part 'stepone_register_save_entity.freezed.dart';


@freezed
class SteponeRegisterSaveEntity with _$SteponeRegisterSaveEntity {
    const factory SteponeRegisterSaveEntity({
        int? responseCode,
        String? message,
       RegisterData? registerData,
    }) = _SteponeRegisterSaveEntity;

   
}

@freezed
class RegisterData with _$RegisterData {
    const factory RegisterData({
        String? userName,
        String? companyName,
        String? companyWebsite,
        String? workingEmail,
        String? contactNumber,
        String? countryToSendSms,
        bool? hasIndianRegisteredSenderId,
        String? usageDescription,
        String? userAccountType,
        String? userAddress,
        String? userCountry,
        String? userCity,
        String? userState,
        int? userZipCode,
        bool? resellerType,
        String? customerId,
    }) = _RegisterData;

   
}

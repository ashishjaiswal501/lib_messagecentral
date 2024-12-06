// To parse this JSON data, do
//
//     final findByCustomerIdDto = findByCustomerIdDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';


import 'package:messagecentral/features/find_by_customer_id/domain/entity/find_by_customer_id_entity.dart';

part 'find_by_customer_id_dto.freezed.dart';
part 'find_by_customer_id_dto.g.dart';

@freezed
class FindByCustomerIdDto with _$FindByCustomerIdDto {
  const factory FindByCustomerIdDto({
    @JsonKey(name: "responseCode") int? responseCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _FindByCustomerIdDto;

  factory FindByCustomerIdDto.fromJson(Map<String, dynamic> json) =>
      _$FindByCustomerIdDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "customerId") String? customerId,
    @JsonKey(name: "firstName") String? firstName,
    @JsonKey(name: "lastName") String? lastName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "password") String? password,
    @JsonKey(name: "phoneCode") String? phoneCode,
    @JsonKey(name: "phoneNo") String? phoneNo,
    @JsonKey(name: "application") Application? application,
    @JsonKey(name: "wallet") Wallet? wallet,
    @JsonKey(name: "authToken") String? authToken,
    // @JsonKey(name: "createdDateTime") List<int>? createdDateTime,
    // @JsonKey(name: "updatedDateTime") List<int>? updatedDateTime,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "postalCode") String? postalCode,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "newUser") bool? newUser,
    @JsonKey(name: "brandName") String? brandName,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Application with _$Application {
  const factory Application({
    @JsonKey(name: "customerId") String? customerId,
    @JsonKey(name: "clientId") String? clientId,
    @JsonKey(name: "apiKey") String? apiKey,
    @JsonKey(name: "createdDateTime") List<dynamic>? createdDateTime,
    @JsonKey(name: "updatedDateTime") List<dynamic>? updatedDateTime,
    @JsonKey(name: "description") dynamic description,
    @JsonKey(name: "displayAppName") dynamic displayAppName,
    @JsonKey(name: "otpLength") String? otpLength,
    @JsonKey(name: "isActive") bool? isActive,
    @JsonKey(name: "isSmsActive") bool? isSmsActive,
    @JsonKey(name: "isSmsDiscountAvaliable") bool? isSmsDiscountAvaliable,
    @JsonKey(name: "clientIdSms") dynamic clientIdSms,
    @JsonKey(name: "apiKeySms") dynamic apiKeySms,
    @JsonKey(name: "senderIdSms") dynamic senderIdSms,
    @JsonKey(name: "smsDiscountPercentage") int? smsDiscountPercentage,
    @JsonKey(name: "isEmailActive") bool? isEmailActive,
    @JsonKey(name: "isEmailDiscountAvaliable") bool? isEmailDiscountAvaliable,
    @JsonKey(name: "emailDiscountPercentage") int? emailDiscountPercentage,
    @JsonKey(name: "isWhatsAppActive") bool? isWhatsAppActive,
    @JsonKey(name: "isWhatsAppDiscountAvaliable")
    bool? isWhatsAppDiscountAvaliable,
    @JsonKey(name: "wnMarketingDiscountPercentage")
    int? wnMarketingDiscountPercentage,
    @JsonKey(name: "wnUtilityDiscountPercentage")
    int? wnUtilityDiscountPercentage,
    @JsonKey(name: "wnServiceDiscountPercentage")
    int? wnServiceDiscountPercentage,
    @JsonKey(name: "wnAuthenticationDiscountPercentage")
    int? wnAuthenticationDiscountPercentage,
    @JsonKey(name: "priceDeductionMode") String? priceDeductionMode,
    @JsonKey(name: "active") bool? active,
    @JsonKey(name: "smsActive") bool? smsActive,
    @JsonKey(name: "smsDiscountAvaliable") bool? smsDiscountAvaliable,
    @JsonKey(name: "emailActive") bool? emailActive,
    @JsonKey(name: "emailDiscountAvaliable") bool? emailDiscountAvaliable,
    @JsonKey(name: "whatsAppActive") bool? whatsAppActive,
    @JsonKey(name: "whatsAppDiscountAvaliable") bool? whatsAppDiscountAvaliable,
  }) = _Application;

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);
}

@freezed
class Wallet with _$Wallet {
  const factory Wallet({
    @JsonKey(name: "customerId") String? customerId,
    @JsonKey(name: "credits") double? credits,
    @JsonKey(name: "lastRechargedCredit") double? lastRechargedCredit,
    @JsonKey(name: "createdDateTime") DateTime? createdDateTime,
    @JsonKey(name: "updatedDateTime") DateTime? updatedDateTime,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}

extension FindByCustomerIdEntityExtension on FindByCustomerIdDto {
  FindByCustomerIdEntity get toEntity => FindByCustomerIdEntity(
      responseCode: responseCode, message: message, data: data?.toEntity());
}

extension GetUserDataEntityExtention on Data {
  GetUserData toEntity() {
    return GetUserData(
      customerId: customerId ?? "",
      firstName: firstName ?? "",
      lastName: lastName ?? "",
      email: email ?? "",
      password: password ?? "",
      phoneCode: phoneCode ?? "",
      phoneNo: phoneNo ?? "",
      application: application?.toEntityApplication,
      wallet: wallet?.toEntityWallet,
      authToken: authToken ?? "",
      // createdDateTime: createdDateTime,
      //updatedDateTime: updatedDateTime,
      address: address ?? "",
      city: city ?? "",
      state: state ?? "",
      postalCode: postalCode ?? "",
      country: country ?? "",
      newUser: newUser ?? false,
      brandName: brandName ?? "",
    );
  }
}

extension WalletEntityExtension on Wallet {
  WalletEntity get toEntityWallet => WalletEntity(
        customerId: customerId ?? "",
        credits: credits ?? 0.0,
        lastRechargedCredit: lastRechargedCredit ?? 0.0,
        createdDateTime: createdDateTime,
        updatedDateTime: updatedDateTime,
      );
}

extension ApplicationEntityExtension on Application {
  ApplicationEntity get toEntityApplication => ApplicationEntity(
        customerId: customerId ?? "",
        clientId: clientId ?? "",
        apiKey: apiKey ?? "",
        // createdDateTime: createdDateTime,
        // updatedDateTime: updatedDateTime,
        description: description?.toString() ?? "",
        displayAppName: displayAppName?.toString() ?? "",
        otpLength: otpLength ?? "",
        isActive: isActive ?? false,
        isSmsActive: isSmsActive ?? false,
        // isSmsDiscountAvaliable: isSmsDiscountAvaliable ?? false,
        clientIdSms: clientIdSms?.toString() ?? "",
        apiKeySms: apiKeySms?.toString() ?? "",
        senderIdSms: senderIdSms?.toString() ?? "",
        smsDiscountPercentage: smsDiscountPercentage ?? 0,
        isEmailActive: isEmailActive ?? false,

        ///  isEmailDiscountAvaliable: isEmailDiscountAvaliable ?? false,
        emailDiscountPercentage: emailDiscountPercentage ?? 0,
        isWhatsAppActive: isWhatsAppActive ?? false,
        //   isWhatsAppDiscountAvaliable: isWhatsAppDiscountAvaliable ?? false,
        wnMarketingDiscountPercentage: wnMarketingDiscountPercentage ?? 0,
        wnUtilityDiscountPercentage: wnUtilityDiscountPercentage ?? 0,
        wnServiceDiscountPercentage: wnServiceDiscountPercentage ?? 0,
        wnAuthenticationDiscountPercentage:
            wnAuthenticationDiscountPercentage ?? 0,
        priceDeductionMode: priceDeductionMode ?? "",
        active: active ?? false,
        smsActive: smsActive ?? false,
        // smsDiscountAvaliable: smsDiscountAvaliable ?? false,
        emailActive: emailActive ?? false,
        // emailDiscountAvaliable: emailDiscountAvaliable ?? false,
        whatsAppActive: whatsAppActive ?? false,
        // whatsAppDiscountAvaliable: whatsAppDiscountAvaliable ?? false,
      );
}

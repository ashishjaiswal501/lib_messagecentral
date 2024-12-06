import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_by_customer_id_entity.freezed.dart';

@freezed
class FindByCustomerIdEntity with _$FindByCustomerIdEntity {
  const factory FindByCustomerIdEntity({
    int? responseCode,
    String? message,
    GetUserData? data,
  }) = _FindByCustomerIdEntity;
}

@freezed
class GetUserData with _$GetUserData {
  const factory GetUserData({
    String? customerId,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phoneCode,
    String? phoneNo,
    String? authToken,
    List<dynamic>? createdDateTime,
    List<dynamic>? updatedDateTime,
    String? address,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    bool? newUser,
    String? brandName,
    WalletEntity? wallet,
    ApplicationEntity? application,
  }) = _GetUserData;
}

@freezed
class ApplicationEntity with _$ApplicationEntity {
  const factory ApplicationEntity({
    String? customerId,
    String? clientId,
    String? apiKey,
    List<dynamic>? createdDateTime,
    List<dynamic>? updatedDateTime,
    String? description,
    String? displayAppName,
    String? otpLength,
    bool? isActive,
    bool? isSmsActive,
    bool? isSmsDiscountAvailable,
    String? clientIdSms,
    String? apiKeySms,
    String? senderIdSms,
    int? smsDiscountPercentage,
    bool? isEmailActive,
    bool? isEmailDiscountAvailable,
    int? emailDiscountPercentage,
    bool? isWhatsAppActive,
    bool? isWhatsAppDiscountAvailable,
    int? wnMarketingDiscountPercentage,
    int? wnUtilityDiscountPercentage,
    int? wnServiceDiscountPercentage,
    int? wnAuthenticationDiscountPercentage,
    String? priceDeductionMode,
    bool? active,
    bool? smsActive,
    bool? smsDiscountAvailable,
    bool? emailActive,
    bool? emailDiscountAvailable,
    bool? whatsAppActive,
    bool? whatsAppDiscountAvailable,
  }) = _ApplicationEntity;
}

@freezed
class WalletEntity with _$WalletEntity {
  const factory WalletEntity({
    double? credits,
    String? customerId,
    double? lastRechargedCredit,
    DateTime? updatedDateTime,
    DateTime? createdDateTime,
  }) = _WalletEntity;
}

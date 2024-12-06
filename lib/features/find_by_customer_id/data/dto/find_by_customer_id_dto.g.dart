// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_by_customer_id_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FindByCustomerIdDtoImpl _$$FindByCustomerIdDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FindByCustomerIdDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FindByCustomerIdDtoImplToJson(
        _$FindByCustomerIdDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      customerId: json['customerId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phoneCode: json['phoneCode'] as String?,
      phoneNo: json['phoneNo'] as String?,
      application: json['application'] == null
          ? null
          : Application.fromJson(json['application'] as Map<String, dynamic>),
      wallet: json['wallet'] == null
          ? null
          : Wallet.fromJson(json['wallet'] as Map<String, dynamic>),
      authToken: json['authToken'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String?,
      newUser: json['newUser'] as bool?,
      brandName: json['brandName'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'phoneCode': instance.phoneCode,
      'phoneNo': instance.phoneNo,
      'application': instance.application,
      'wallet': instance.wallet,
      'authToken': instance.authToken,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'newUser': instance.newUser,
      'brandName': instance.brandName,
    };

_$ApplicationImpl _$$ApplicationImplFromJson(Map<String, dynamic> json) =>
    _$ApplicationImpl(
      customerId: json['customerId'] as String?,
      clientId: json['clientId'] as String?,
      apiKey: json['apiKey'] as String?,
      createdDateTime: json['createdDateTime'] as List<dynamic>?,
      updatedDateTime: json['updatedDateTime'] as List<dynamic>?,
      description: json['description'],
      displayAppName: json['displayAppName'],
      otpLength: json['otpLength'] as String?,
      isActive: json['isActive'] as bool?,
      isSmsActive: json['isSmsActive'] as bool?,
      isSmsDiscountAvaliable: json['isSmsDiscountAvaliable'] as bool?,
      clientIdSms: json['clientIdSms'],
      apiKeySms: json['apiKeySms'],
      senderIdSms: json['senderIdSms'],
      smsDiscountPercentage: (json['smsDiscountPercentage'] as num?)?.toInt(),
      isEmailActive: json['isEmailActive'] as bool?,
      isEmailDiscountAvaliable: json['isEmailDiscountAvaliable'] as bool?,
      emailDiscountPercentage:
          (json['emailDiscountPercentage'] as num?)?.toInt(),
      isWhatsAppActive: json['isWhatsAppActive'] as bool?,
      isWhatsAppDiscountAvaliable: json['isWhatsAppDiscountAvaliable'] as bool?,
      wnMarketingDiscountPercentage:
          (json['wnMarketingDiscountPercentage'] as num?)?.toInt(),
      wnUtilityDiscountPercentage:
          (json['wnUtilityDiscountPercentage'] as num?)?.toInt(),
      wnServiceDiscountPercentage:
          (json['wnServiceDiscountPercentage'] as num?)?.toInt(),
      wnAuthenticationDiscountPercentage:
          (json['wnAuthenticationDiscountPercentage'] as num?)?.toInt(),
      priceDeductionMode: json['priceDeductionMode'] as String?,
      active: json['active'] as bool?,
      smsActive: json['smsActive'] as bool?,
      smsDiscountAvaliable: json['smsDiscountAvaliable'] as bool?,
      emailActive: json['emailActive'] as bool?,
      emailDiscountAvaliable: json['emailDiscountAvaliable'] as bool?,
      whatsAppActive: json['whatsAppActive'] as bool?,
      whatsAppDiscountAvaliable: json['whatsAppDiscountAvaliable'] as bool?,
    );

Map<String, dynamic> _$$ApplicationImplToJson(_$ApplicationImpl instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'clientId': instance.clientId,
      'apiKey': instance.apiKey,
      'createdDateTime': instance.createdDateTime,
      'updatedDateTime': instance.updatedDateTime,
      'description': instance.description,
      'displayAppName': instance.displayAppName,
      'otpLength': instance.otpLength,
      'isActive': instance.isActive,
      'isSmsActive': instance.isSmsActive,
      'isSmsDiscountAvaliable': instance.isSmsDiscountAvaliable,
      'clientIdSms': instance.clientIdSms,
      'apiKeySms': instance.apiKeySms,
      'senderIdSms': instance.senderIdSms,
      'smsDiscountPercentage': instance.smsDiscountPercentage,
      'isEmailActive': instance.isEmailActive,
      'isEmailDiscountAvaliable': instance.isEmailDiscountAvaliable,
      'emailDiscountPercentage': instance.emailDiscountPercentage,
      'isWhatsAppActive': instance.isWhatsAppActive,
      'isWhatsAppDiscountAvaliable': instance.isWhatsAppDiscountAvaliable,
      'wnMarketingDiscountPercentage': instance.wnMarketingDiscountPercentage,
      'wnUtilityDiscountPercentage': instance.wnUtilityDiscountPercentage,
      'wnServiceDiscountPercentage': instance.wnServiceDiscountPercentage,
      'wnAuthenticationDiscountPercentage':
          instance.wnAuthenticationDiscountPercentage,
      'priceDeductionMode': instance.priceDeductionMode,
      'active': instance.active,
      'smsActive': instance.smsActive,
      'smsDiscountAvaliable': instance.smsDiscountAvaliable,
      'emailActive': instance.emailActive,
      'emailDiscountAvaliable': instance.emailDiscountAvaliable,
      'whatsAppActive': instance.whatsAppActive,
      'whatsAppDiscountAvaliable': instance.whatsAppDiscountAvaliable,
    };

_$WalletImpl _$$WalletImplFromJson(Map<String, dynamic> json) => _$WalletImpl(
      customerId: json['customerId'] as String?,
      credits: (json['credits'] as num?)?.toDouble(),
      lastRechargedCredit: (json['lastRechargedCredit'] as num?)?.toDouble(),
      createdDateTime: json['createdDateTime'] == null
          ? null
          : DateTime.parse(json['createdDateTime'] as String),
      updatedDateTime: json['updatedDateTime'] == null
          ? null
          : DateTime.parse(json['updatedDateTime'] as String),
    );

Map<String, dynamic> _$$WalletImplToJson(_$WalletImpl instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'credits': instance.credits,
      'lastRechargedCredit': instance.lastRechargedCredit,
      'createdDateTime': instance.createdDateTime?.toIso8601String(),
      'updatedDateTime': instance.updatedDateTime?.toIso8601String(),
    };

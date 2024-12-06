// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_offer_eligibility_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckOfferEligibilityDtoImpl _$$CheckOfferEligibilityDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckOfferEligibilityDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$$CheckOfferEligibilityDtoImplToJson(
        _$CheckOfferEligibilityDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

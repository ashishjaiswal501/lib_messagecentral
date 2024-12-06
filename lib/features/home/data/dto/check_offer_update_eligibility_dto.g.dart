// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_offer_update_eligibility_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckOfferUpdateEligibilityDtoImpl
    _$$CheckOfferUpdateEligibilityDtoImplFromJson(Map<String, dynamic> json) =>
        _$CheckOfferUpdateEligibilityDtoImpl(
          responseCode: (json['responseCode'] as num?)?.toInt(),
          message: json['message'] as String?,
          data: json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$CheckOfferUpdateEligibilityDtoImplToJson(
        _$CheckOfferUpdateEligibilityDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      username: json['Username'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'endDate': instance.endDate?.toIso8601String(),
      'Username': instance.username,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_code_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryCodeDtoImpl _$$CountryCodeDtoImplFromJson(Map<String, dynamic> json) =>
    _$CountryCodeDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CountryCodeDtoImplToJson(
        _$CountryCodeDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: (json['id'] as num?)?.toInt(),
      phoneCode: json['phoneCode'] as String?,
      isoCountryCode: json['isoCountryCode'] as String?,
      name: json['name'] as String?,
      minLength: (json['minLength'] as num?)?.toInt(),
      maxLength: (json['maxLength'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneCode': instance.phoneCode,
      'isoCountryCode': instance.isoCountryCode,
      'name': instance.name,
      'minLength': instance.minLength,
      'maxLength': instance.maxLength,
    };

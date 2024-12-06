// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_a_user_update_brand_name_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyAUserUpdateBrandNameDtoImpl
    _$$VerifyAUserUpdateBrandNameDtoImplFromJson(Map<String, dynamic> json) =>
        _$VerifyAUserUpdateBrandNameDtoImpl(
          responseCode: (json['responseCode'] as num?)?.toInt(),
          message: json['message'] as String?,
          data: json['data'],
        );

Map<String, dynamic> _$$VerifyAUserUpdateBrandNameDtoImplToJson(
        _$VerifyAUserUpdateBrandNameDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

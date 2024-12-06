// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_reporting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailsReportingDtoImpl _$$DetailsReportingDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailsReportingDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailsReportingDtoImplToJson(
        _$DetailsReportingDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'count': instance.count,
    };

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      countryCode: json['countryCode'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      senderId: json['senderId'],
      templateId: json['templateId'],
      messageBody: json['messageBody'] as String?,
      status: json['status'] as String?,
      errorCode: json['errorCode'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      deliveredAt: json['deliveredAt'] == null
          ? null
          : DateTime.parse(json['deliveredAt'] as String),
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'mobileNumber': instance.mobileNumber,
      'senderId': instance.senderId,
      'templateId': instance.templateId,
      'messageBody': instance.messageBody,
      'status': instance.status,
      'errorCode': instance.errorCode,
      'createdAt': instance.createdAt?.toIso8601String(),
      'deliveredAt': instance.deliveredAt?.toIso8601String(),
      'updatedAt': instance.updatedAt,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_otp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardOtpDtoImpl _$$DashboardOtpDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardOtpDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardOtpDtoImplToJson(
        _$DashboardOtpDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      customerId: json['customerId'] as String?,
      sent: (json['sent'] as num?)?.toInt(),
      delivered: (json['delivered'] as num?)?.toInt(),
      verified: (json['verified'] as num?)?.toInt(),
      failed: (json['failed'] as num?)?.toInt(),
      deliveredPercentage: (json['deliveredPercentage'] as num?)?.toDouble(),
      verifiedPercentage: (json['verifiedPercentage'] as num?)?.toDouble(),
      failedPercentage: (json['failedPercentage'] as num?)?.toDouble(),
      totalCost: (json['totalCost'] as num?)?.toDouble(),
      countryWiseCount: (json['countryWiseCount'] as List<dynamic>?)
          ?.map((e) => CountryWiseCount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'sent': instance.sent,
      'delivered': instance.delivered,
      'verified': instance.verified,
      'failed': instance.failed,
      'deliveredPercentage': instance.deliveredPercentage,
      'verifiedPercentage': instance.verifiedPercentage,
      'failedPercentage': instance.failedPercentage,
      'totalCost': instance.totalCost,
      'countryWiseCount': instance.countryWiseCount,
    };

_$CountryWiseCountImpl _$$CountryWiseCountImplFromJson(
        Map<String, dynamic> json) =>
    _$CountryWiseCountImpl(
      countryName: json['countryName'] as String?,
      countryCode: json['countryCode'] as String?,
      sent: (json['sent'] as num?)?.toInt(),
      delivered: (json['delivered'] as num?)?.toInt(),
      verified: (json['verified'] as num?)?.toInt(),
      failed: (json['failed'] as num?)?.toInt(),
      cost: (json['cost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CountryWiseCountImplToJson(
        _$CountryWiseCountImpl instance) =>
    <String, dynamic>{
      'countryName': instance.countryName,
      'countryCode': instance.countryCode,
      'sent': instance.sent,
      'delivered': instance.delivered,
      'verified': instance.verified,
      'failed': instance.failed,
      'cost': instance.cost,
    };

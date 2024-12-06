// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_details_reporting_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsReportingRequestPrams _$DetailsReportingRequestPramsFromJson(
        Map<String, dynamic> json) =>
    DetailsReportingRequestPrams(
      customerId: json['customerId'] as String? ?? '',
      from: json['from'] as String? ?? '',
      pageNo: json['pageNo'] as String? ?? '',
      size: json['size'] as String? ?? '',
      to: json['to'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$DetailsReportingRequestPramsToJson(
        DetailsReportingRequestPrams instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'from': instance.from,
      'pageNo': instance.pageNo,
      'size': instance.size,
      'to': instance.to,
      'type': instance.type,
    };

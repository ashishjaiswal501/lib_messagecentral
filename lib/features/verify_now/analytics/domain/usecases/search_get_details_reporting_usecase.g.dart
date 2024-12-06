// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_get_details_reporting_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchDetailsReportingRequestPrams _$SearchDetailsReportingRequestPramsFromJson(
        Map<String, dynamic> json) =>
    SearchDetailsReportingRequestPrams(
      customerId: json['customerId'] as String? ?? '',
      query: json['query'] as String? ?? '',
      pageNo: json['pageNo'] as String? ?? '',
      size: json['size'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$SearchDetailsReportingRequestPramsToJson(
        SearchDetailsReportingRequestPrams instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'query': instance.query,
      'pageNo': instance.pageNo,
      'size': instance.size,
      'type': instance.type,
    };

// To parse this JSON data, do
//
//     final analyticsDto = analyticsDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/analytics_entity.dart';

part 'analytics_dto.freezed.dart';
part 'analytics_dto.g.dart';

@freezed
class AnalyticsDto with _$AnalyticsDto {
  const factory AnalyticsDto({
    @JsonKey(name: "responseCode") int? responseCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _AnalyticsDto;

  factory AnalyticsDto.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "customerId") String? customerId,
    @JsonKey(name: "sent") int? sent,
    @JsonKey(name: "delivered") int? delivered,
    @JsonKey(name: "verified") int? verified,
    @JsonKey(name: "failed") int? failed,
    @JsonKey(name: "deliveredPercentage") double? deliveredPercentage,
    @JsonKey(name: "verifiedPercentage") double? verifiedPercentage,
    @JsonKey(name: "failedPercentage") double? failedPercentage,
    @JsonKey(name: "totalCost") double? totalCost,
    @JsonKey(name: "countryWiseCount") List<CountryWiseCount>? countryWiseCount,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class CountryWiseCount with _$CountryWiseCount {
  const factory CountryWiseCount({
    @JsonKey(name: "countryName") String? countryName,
    @JsonKey(name: "countryCode") String? countryCode,
    @JsonKey(name: "sent") int? sent,
    @JsonKey(name: "delivered") int? delivered,
    @JsonKey(name: "verified") int? verified,
    @JsonKey(name: "failed") int? failed,
    @JsonKey(name: "cost") double? cost,
  }) = _CountryWiseCount;

  factory CountryWiseCount.fromJson(Map<String, dynamic> json) =>
      _$CountryWiseCountFromJson(json);
}

extension AnalyticsEntityDto on AnalyticsDto {
  AnalyticsEntity get toEntity => AnalyticsEntity(
      responseCode: responseCode,
      message: message,
      analyticsData: data?.toEntity);
}

extension AnalyticsDataEntityDto on Data {
  AnalyticsData get toEntity => AnalyticsData(
        customerId: customerId,
        sent: sent,
        delivered: delivered,
        verified: verified,
        failed: failed,
        deliveredPercentage: deliveredPercentage,
        verifiedPercentage: verifiedPercentage,
        failedPercentage: failedPercentage,
        totalCost: totalCost,
        countryWiseCount:
            countryWiseCount?.map((e) => e.toEntity).toList() ?? [],
      );
}

extension CountryWiseCOuntEntityDto on CountryWiseCount {
  CountryWiseCounts get toEntity => CountryWiseCounts(
      countryCode: countryCode,
      countryName: countryName,
      sent: sent,
      delivered: delivered,
      verified: verified,
      failed: failed,
      cost: cost);
}

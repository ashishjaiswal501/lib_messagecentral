import 'package:freezed_annotation/freezed_annotation.dart';


part 'analytics_entity.freezed.dart';

@freezed
class AnalyticsEntity with _$AnalyticsEntity {
    const factory AnalyticsEntity({
        int? responseCode,
        String? message,
        AnalyticsData? analyticsData,
    }) = _AnalyticsEntity;
}

@freezed
class AnalyticsData with _$AnalyticsData {
    const factory AnalyticsData({
        String? customerId,
        int? sent,
        int? delivered,
        int? verified,
        int? failed,
        double? deliveredPercentage,
        double? verifiedPercentage,
        double? failedPercentage,
        double? totalCost,
        List<CountryWiseCounts>? countryWiseCount,
    }) = _AnalyticsData;
}

@freezed
class CountryWiseCounts with _$CountryWiseCounts {
    const factory CountryWiseCounts({
        String? countryName,
        String? countryCode,
        int? sent,
        int? delivered,
        int? verified,
        int? failed,
        double? cost,
    }) = _CountryWiseCounts;
}

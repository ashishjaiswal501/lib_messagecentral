import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_sms_entity.freezed.dart';

@freezed
class DashboardSmsEntity with _$DashboardSmsEntity {
  const factory DashboardSmsEntity({
    int? responseCode,
    String? message,
    UserData? data,
  }) = _DashboardSmsEntity;
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    String? customerId,
    int? sent,
    int? delivered,
    int? verified,
    int? failed,
    double? deliveredPercentage,
    double? verifiedPercentage,
    double? failedPercentage,
    double? totalCost,
    List<CountryWiseCount>? countryWiseCount,
  }) = _UserData;

  static toEntity() {}
}

@freezed
class CountryWiseCount with _$CountryWiseCount {
  const factory CountryWiseCount({
    String? countryName,
    String? countryCode,
    int? sent,
    int? delivered,
    int? verified,
    int? failed,
    double? cost,
  }) = _CountryWiseCount;
}

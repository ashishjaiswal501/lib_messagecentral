import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:messagecentral/features/verify_now/dashboard/domain/entity/dashboard_otp_entity.dart';

part 'dashboard_otp_dto.freezed.dart';
part 'dashboard_otp_dto.g.dart';


@freezed
class DashboardOtpDto with _$DashboardOtpDto {
    const factory DashboardOtpDto({
        @JsonKey(name: "responseCode")
        int? responseCode,
        @JsonKey(name: "message")
        String? message,
        @JsonKey(name: "data")
        Data? data,
    }) = _DashboardOtpDto;

    factory DashboardOtpDto.fromJson(Map<String, dynamic> json) => _$DashboardOtpDtoFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        @JsonKey(name: "customerId")
        String? customerId,
        @JsonKey(name: "sent")
        int? sent,
        @JsonKey(name: "delivered")
        int? delivered,
        @JsonKey(name: "verified")
        int? verified,
        @JsonKey(name: "failed")
        int? failed,
        @JsonKey(name: "deliveredPercentage")
        double? deliveredPercentage,
        @JsonKey(name: "verifiedPercentage")
        double? verifiedPercentage,
        @JsonKey(name: "failedPercentage")
        double? failedPercentage,
        @JsonKey(name: "totalCost")
        double? totalCost,
        @JsonKey(name: "countryWiseCount")
        List<CountryWiseCount>? countryWiseCount,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
    
      
}

@freezed
class CountryWiseCount with _$CountryWiseCount {
    const factory CountryWiseCount({
        @JsonKey(name: "countryName")
        String? countryName,
        @JsonKey(name: "countryCode")
        String? countryCode,
        @JsonKey(name: "sent")
        int? sent,
        @JsonKey(name: "delivered")
        int? delivered,
        @JsonKey(name: "verified")
        int? verified,
        @JsonKey(name: "failed")
        int? failed,
        @JsonKey(name: "cost")
        double? cost,
    }) = _CountryWiseCount;

    factory CountryWiseCount.fromJson(Map<String, dynamic> json) => _$CountryWiseCountFromJson(json);
}


// toentity
extension DashnoardESmsntityExtension on DashboardOtpDto {
  DashboardOtpEntity get toEntity => DashboardOtpEntity(
      responseCode: responseCode, message: message, data: data?.toEntity());
}


extension UserDataEntityExtention on Data {
  UserData toEntity() {
    return UserData(
       customerId: customerId,
        sent: sent,
        delivered: delivered,
        verified: verified,
        failed: failed,
        deliveredPercentage: deliveredPercentage,
        verifiedPercentage: verifiedPercentage,
        failedPercentage: failedPercentage,
        totalCost: totalCost,
       countryWiseCount:[],
    );
  }
}


/// countryWiseCount  extention 
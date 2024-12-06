
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_details_reporting_entity.freezed.dart';

@freezed
class DetailsReportingSearchEntity with _$DetailsReportingSearchEntity {
   const factory DetailsReportingSearchEntity({
        int? responseCode,
        String? message,
        ReportingData? data,
       
    }
    ) = _DetailsReportingSearchEntity;
   
 
 
 
}
 
 
 
@freezed
class ReportingData with _$ReportingData {
    const factory ReportingData({
       List<DatumReport>? data,
        int? count,
    }) = _ReportingData;
}
 
 
@freezed
class DatumReport with _$DatumReport{
    const factory DatumReport({
        String? countryCode,
        String? mobileNumber,
        dynamic senderId,
        dynamic templateId,
        String? messageBody,
        String? status,
        dynamic errorCode,
        DateTime? createdAt,
        DateTime? deliveredAt,
        dynamic updatedAt,
    }) = _DatumReport;
}
 
 
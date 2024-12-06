// To parse this JSON data, do
//
//     final searchDetailsReportingDto = searchDetailsReportingDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';


import 'package:messagecentral/features/verify_now/analytics/domain/entity/search_details_reporting_entity.dart';

part 'search_details_reporting_dto.freezed.dart';
part 'search_details_reporting_dto.g.dart';

@freezed
class DetailsReportingSearchDto with _$DetailsReportingSearchDto {
  const factory DetailsReportingSearchDto({
   @JsonKey(name: "responseCode")
        int? responseCode,
        @JsonKey(name: "message")
        String? message,
        @JsonKey(name: "data")
        Data? data,
  }) = _DetailsReportingSearchDto;
 
  factory DetailsReportingSearchDto.fromJson(Map<String, dynamic> json) =>
      _$DetailsReportingSearchDtoFromJson(json);
}
 
@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'data')
    List<Datum>? data,
    int? count,
   
   
  }) = _Data;
 
 
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
 
@freezed
class Datum with _$Datum {
    const factory Datum({
        @JsonKey(name: "countryCode")
        String? countryCode,
        @JsonKey(name: "mobileNumber")
        String? mobileNumber,
        @JsonKey(name: "senderId")
        dynamic senderId,
        @JsonKey(name: "templateId")
        dynamic templateId,
        @JsonKey(name: "messageBody")
        String? messageBody,
        @JsonKey(name: "status")
        String? status,
        @JsonKey(name: "errorCode")
        dynamic errorCode,
        @JsonKey(name: "createdAt")
        DateTime? createdAt,
        @JsonKey(name: "deliveredAt")
        DateTime? deliveredAt,
        @JsonKey(name: "updatedAt")
        dynamic updatedAt,
    }) = _Datum;
 
    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}
 
 
 
 
extension DetailsReportingEntityDto on DetailsReportingSearchDto {
  DetailsReportingSearchEntity get toEntity => DetailsReportingSearchEntity(
      responseCode: responseCode,
      message: message,
      data: data?.toEntity
     
      );
}
 
 
 
extension DetailsReportingDataEntityDto on Data {
  ReportingData get toEntity => ReportingData(
        count: count,
        data: data?.map((e) => e.toEntity).toList()??[]
      );
}
 
extension DetailsReportDatumEntityDto on Datum {
  DatumReport get toEntity => DatumReport(
        countryCode: countryCode?? '',
        createdAt: createdAt,
        errorCode: errorCode??'',
        mobileNumber: mobileNumber??'',
        senderId: senderId??'',
        templateId: templateId??'',
        messageBody: messageBody??'',
        status: status??'',
        deliveredAt: deliveredAt,
        updatedAt: updatedAt??'',
      );
}
 
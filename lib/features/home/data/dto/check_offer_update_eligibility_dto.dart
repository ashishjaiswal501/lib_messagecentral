// To parse this JSON data, do
//
//     final checkOfferUpdateEligibilityDto = checkOfferUpdateEligibilityDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:messagecentral/features/home/domain/enitity/check_offer_update_eligibility_entity.dart';

part 'check_offer_update_eligibility_dto.freezed.dart';
part 'check_offer_update_eligibility_dto.g.dart';

CheckOfferUpdateEligibilityDto checkOfferUpdateEligibilityDtoFromJson(
        String str) =>
    CheckOfferUpdateEligibilityDto.fromJson(json.decode(str));

String checkOfferUpdateEligibilityDtoToJson(
        CheckOfferUpdateEligibilityDto data) =>
    json.encode(data.toJson());

@freezed
class CheckOfferUpdateEligibilityDto with _$CheckOfferUpdateEligibilityDto {
  const factory CheckOfferUpdateEligibilityDto({
    @JsonKey(name: "responseCode") int? responseCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _CheckOfferUpdateEligibilityDto;

  factory CheckOfferUpdateEligibilityDto.fromJson(Map<String, dynamic> json) =>
      _$CheckOfferUpdateEligibilityDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "endDate") DateTime? endDate,
    @JsonKey(name: "Username") String? username,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

extension CheckOfferEligibilityUpdateEnitityDto
    on CheckOfferUpdateEligibilityDto {
  CheckOfferUpdateEligibilityEntity get toEnity =>
      CheckOfferUpdateEligibilityEntity(
        responseCode: responseCode,
        message: message,
        data: data?.toOfferEnity,
      );
}

extension DataOfferEx on Data {
  Dataoffer get toOfferEnity => Dataoffer(username: username, endDate: endDate);
}

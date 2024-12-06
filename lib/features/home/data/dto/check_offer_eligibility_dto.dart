// To parse this JSON data, do
//
//     final checkOfferEligibilityDto = checkOfferEligibilityDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:messagecentral/features/home/domain/enitity/check_offer_eligibility_entity.dart';

part 'check_offer_eligibility_dto.freezed.dart';
part 'check_offer_eligibility_dto.g.dart';

CheckOfferEligibilityDto checkOfferEligibilityDtoFromJson(String str) =>
    CheckOfferEligibilityDto.fromJson(json.decode(str));

String checkOfferEligibilityDtoToJson(CheckOfferEligibilityDto data) =>
    json.encode(data.toJson());

@freezed
class CheckOfferEligibilityDto with _$CheckOfferEligibilityDto {
  const factory CheckOfferEligibilityDto({
    @JsonKey(name: "responseCode") int? responseCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") dynamic data,
  }) = _CheckOfferEligibilityDto;

  factory CheckOfferEligibilityDto.fromJson(Map<String, dynamic> json) =>
      _$CheckOfferEligibilityDtoFromJson(json);
}

extension CheckOfferEligibilityEnitityDto on CheckOfferEligibilityDto {
  CheckOfferEligibilityEntity get toEnity =>
   CheckOfferEligibilityEntity(
    responseCode: responseCode,
    message: message,
    data: data,
  );
}

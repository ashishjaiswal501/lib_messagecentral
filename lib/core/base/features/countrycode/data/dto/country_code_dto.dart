import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:messagecentral/core/base/features/countrycode/domain/entity/country_code_entity.dart';

part 'country_code_dto.freezed.dart';
part 'country_code_dto.g.dart';

@freezed
class CountryCodeDto with _$CountryCodeDto {
  const factory CountryCodeDto({
    @JsonKey(name: "responseCode") int? responseCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<Data>? data,
  }) = _CountryCodeDto;

  factory CountryCodeDto.fromJson(Map<String, dynamic> json) =>
      _$CountryCodeDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "phoneCode") String? phoneCode,
    @JsonKey(name: "isoCountryCode") String? isoCountryCode,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "minLength") int? minLength,
    @JsonKey(name: "maxLength") int? maxLength,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

extension CountryDataEntityExtension on Data {
  CountryData get formtoEntity => CountryData(
      id: id,
      phoneCode: phoneCode,
      isoCountryCode: isoCountryCode,
      name: name,
      maxLength: maxLength,
      minLength: minLength);
}

extension CountryCodeEntityExtension on CountryCodeDto {
  CountryCodeEntity get formtoEntity => CountryCodeEntity(
      responseCode: responseCode,
      message: message,
      data: data?.map((e) => e.formtoEntity).toList() ?? []);
}

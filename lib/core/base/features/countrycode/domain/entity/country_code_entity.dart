import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_code_entity.freezed.dart';

@unfreezed
class CountryCodeEntity with _$CountryCodeEntity {
  factory CountryCodeEntity({
    int? responseCode,
    String? message,
    List<CountryData>? data,
  }) = _CountryCodeEntity;
}

@unfreezed
class CountryData with _$CountryData {
  factory CountryData({
    int? id,
    String? phoneCode,
    String? isoCountryCode,
    String? name,
    int? minLength,
    int? maxLength,
  }) = _CountryData;
}

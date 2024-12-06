import 'package:messagecentral/core/base/features/countrycode/domain/entity/country_code_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'country_code_cubit_state.freezed.dart';

@freezed
class CountryCodeState with _$CountryCodeState {
  const factory CountryCodeState.initial() = _Initial;
  const factory CountryCodeState.loading() = _Loading;
  const factory CountryCodeState.success(CountryCodeEntity countryCodeEntity) =
      _Success;
  const factory CountryCodeState.error(String errorMessage) = _Error;
}

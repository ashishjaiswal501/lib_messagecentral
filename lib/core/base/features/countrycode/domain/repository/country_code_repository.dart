import 'package:messagecentral/core/base/features/countrycode/domain/entity/country_code_entity.dart';
import 'package:messagecentral/core/resources/data_state.dart';

abstract class CountryCodeRepository {
  Future<DataState<CountryCodeEntity>> getCountryCode();
}

import 'package:messagecentral/core/base/features/countrycode/domain/entity/country_code_entity.dart';
import 'package:messagecentral/core/base/features/countrycode/domain/repository/country_code_repository.dart';
import 'package:messagecentral/core/usecase/usecase.dart';

import '../../../../../resources/data_state.dart';

class GetCountryCodeUseCase
    implements UseCase<DataState<CountryCodeEntity>, void> {
  final CountryCodeRepository countryCodeRepository;
  GetCountryCodeUseCase({required this.countryCodeRepository});

  @override
  Future<DataState<CountryCodeEntity>> call({void pramas}) {
    return countryCodeRepository.getCountryCode();
  }
}

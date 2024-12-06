import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/base/features/countrycode/domain/usecases/get_country_code_usecase.dart';

import 'package:messagecentral/core/base/features/countrycode/presentation/screens/cubit/country_code_cubit_state.dart';
import 'package:messagecentral/core/resources/data_state.dart';

class CountryCodeCubit extends Cubit<CountryCodeState> {
  final GetCountryCodeUseCase getCountryCodeUseCase;
  CountryCodeCubit(this.getCountryCodeUseCase)
      : super(const CountryCodeState.initial());

  getCountryCode() async {
    try {
      emit(const CountryCodeState.loading());
      final dataState = await getCountryCodeUseCase.call();
      if (dataState is DataSuccess && dataState.data != null) {
        emit(CountryCodeState.success(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(CountryCodeState.error(dataState.dioError!));
      }
    } catch (e) {
      const CountryCodeState.initial();
    }
  }
}

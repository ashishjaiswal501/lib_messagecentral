import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/verify_now/credits/domain/usecases/get_low_balance_usecase.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/low_balance_state.dart';

class LowBalanceCubit extends Cubit<LowBalanceState> {
  final GetLowBalanceUsecase getLowBalanceUsecase;
  LowBalanceCubit(this.getLowBalanceUsecase)
      : super(LowBalanceState.initial()) {
    getlowBalance();
  }

  void getlowBalance() async {
    try {
      emit(LowBalanceState.loading());
      final dataState = await getLowBalanceUsecase.call();

      if (dataState is DataSuccess && dataState.data != null) {
        emit(LowBalanceState.success(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(LowBalanceState.error(dataState.dioError!));
      }
    } catch (e) {
     
      emit(LowBalanceState.error(e.toString()));
    }
  }
}

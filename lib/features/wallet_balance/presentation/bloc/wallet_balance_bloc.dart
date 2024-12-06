import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/wallet_balance/domain/usecases/wallet_balance_usecase.dart';
import 'package:messagecentral/features/wallet_balance/presentation/bloc/wallet_balance_event.dart';
import 'package:messagecentral/features/wallet_balance/presentation/bloc/wallet_balance_state.dart';

class WalletBalanceBloc
    extends Bloc<WalletBalanceEvent, WalletBalanceState> {
  final WalletBalanceUsecase walletBalanceUsecase;
  WalletBalanceBloc({required this.walletBalanceUsecase})
      : super(const WalletBalanceStateInitial()) {
    on<WalletBalanceCall>(onWalletBalance);
  }

  void onWalletBalance(
      WalletBalanceCall event, Emitter<WalletBalanceState> emit) async {
    try {
      emit(const WalletBalanceStateLoading());
      final dataState = await walletBalanceUsecase(
        pramas: WalletBalancePrams(
          authToken: LocalStateCache().authToken,
          customerId: LocalStateCache().customerId,
        ),
      );

      if (dataState is DataSuccess && dataState.data!.data != null) {
        emit(WalletBalanceStateSuccess(dataState.data!));
      }
      if (dataState is DataSuccess && dataState.data?.data == null) {
        emit(WalletBalanceStateError(dataState.data!.message!));
      }
      if (dataState is DataFailed) {
        emit(WalletBalanceStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const WalletBalanceStateInitial());
    }
  }
}

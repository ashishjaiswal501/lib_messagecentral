import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/verify_now/credits/domain/usecases/get_low_balance_alert_save_usecase.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/low_balance_alert_save_state.dart';

class LowBalanceAlertSaveCubit extends Cubit<LowBalanceAlertSaveState> {
  final GetLowBalanceAlertSaveUsecase getLowBalanceUsecase;
  LowBalanceAlertSaveCubit(this.getLowBalanceUsecase)
      : super(LowBalanceAlertSaveState.initial());

  void saveLowBlanaceAlert(
      LowBalanceAlertRequest lowBalanceAlertRequest) async {
    try {
      emit(LowBalanceAlertSaveState.loading());
      final dataState =
          await getLowBalanceUsecase.call(pramas: lowBalanceAlertRequest);

      if (dataState is DataSuccess && dataState.data != null) {
        emit(LowBalanceAlertSaveState.success(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(LowBalanceAlertSaveState.error(dataState.dioError!));
      }
    } catch (e) {
      
      emit(LowBalanceAlertSaveState.error(e.toString()));
    }
  }
}

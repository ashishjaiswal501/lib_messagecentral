
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/verify_now/credits/domain/usecases/get_payment_history_usecase.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/payment_history_state.dart';

class PaymnetHistoryCubit extends Cubit<PaymentHistoryState> {
  final GetPaymentHistoryUsecase getPaymentHistoryUsecase;
  PaymnetHistoryCubit(this.getPaymentHistoryUsecase)
      : super(PaymentHistoryState.initial()) {
    // getPaymentHistory(fromDate: '10/02/2024', toDate: '19/02/2024');
  }

  void getPaymentHistory({required fromDate, required String toDate}) async {
    try {
      emit(PaymentHistoryState.loading());
      final dataState = await getPaymentHistoryUsecase.call(
          pramas: PaymentHistoryRequestPrams(
              customerId: LocalStateCache().customerId,
              fromDate: fromDate,
              toDate: toDate));
      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data!.data!.isNotEmpty) {
        emit(PaymentHistoryState.success(dataState.data!));
      }
      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data!.data!.isEmpty) {
        emit(PaymentHistoryState.empty());
      }
      if (dataState is DataFailed) {
        emit(PaymentHistoryState.error(dataState.dioError!));
      }
    } catch (e) {
     
      emit(PaymentHistoryState.error(e.toString()));
    }
  }
}

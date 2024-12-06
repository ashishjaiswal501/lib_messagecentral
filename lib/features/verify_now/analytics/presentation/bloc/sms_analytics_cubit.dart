

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/usecases/get_analytics_usecase.dart';

import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_analytics_state.dart';

class SMSAnalyticsCubit extends Cubit<SMSAnalyticsState> {
  final GetAnalyticsUseCase getAnalyticsUseCase;
  SMSAnalyticsCubit(this.getAnalyticsUseCase)
      : super(SMSAnalyticsState.initial());

  void getAnalytics({required fromDate, required String toDate}) async {
    try {
      emit(SMSAnalyticsState.loading());
      final dataState = await getAnalyticsUseCase.call(
          pramas: AnalyticsRequestPrams(
              customerId: LocalStateCache().customerId,
              fromDate: fromDate,
              type: "SMS",
              toDate: toDate));
      if (dataState is DataSuccess && dataState.data != null) {
        emit(SMSAnalyticsState.success(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(SMSAnalyticsState.error(dataState.dioError!));
      }
    } catch (e) {
      
      emit(SMSAnalyticsState.error("Something went wrong"));
    }
  }
}



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/usecases/get_analytics_usecase.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/otp_analytics_state.dart';

class OtpAnalyticsCubit extends Cubit<OtpAnalyticsState> {
  final GetAnalyticsUseCase getAnalyticsUseCase;
  OtpAnalyticsCubit(this.getAnalyticsUseCase)
      : super(OtpAnalyticsState.initial());

  void getAnalytics({required fromDate, required String toDate}) async {
    try {
      emit(OtpAnalyticsState.loading());
      final dataState = await getAnalyticsUseCase.call(
          pramas: AnalyticsRequestPrams(
              customerId: LocalStateCache().customerId,
              fromDate: fromDate,
              type: "OTP",
              toDate: toDate));
      if (dataState is DataSuccess && dataState.data != null) {
        emit(OtpAnalyticsState.success(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(OtpAnalyticsState.error(dataState.dioError!));
      }
    } catch (e) {
     
      emit(OtpAnalyticsState.error("Something went wrong"));
    }
  }
}

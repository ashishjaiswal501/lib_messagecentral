import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';

import 'package:messagecentral/features/verify_now/analytics/domain/usecases/search_get_details_reporting_usecase.dart';

import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_search_details_reporting_state.dart';

class SmsSearchDetailsReportingCubit
    extends Cubit<SmsSearchDetailsReportingState> {
  final SearchGetDetailsReportingUseCase searchGetDetailsReportingUseCase;
  SmsSearchDetailsReportingCubit(this.searchGetDetailsReportingUseCase)
      : super(SmsSearchDetailsReportingState.initial());

  void otpGetDetailsReporting(
      {required String query,
      required String pageNo,
      required String size,
      required String type}) async {
    try {
      emit(SmsSearchDetailsReportingState.loading());
      final dataState = await searchGetDetailsReportingUseCase.call(
          pramas: SearchDetailsReportingRequestPrams(
        query: query,
        pageNo: pageNo,
        size: size,
        type: "SMS",
      ));
    if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data!.data != null) {
        emit(SmsSearchDetailsReportingState.success(dataState.data!));
      }

      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data!.data == null) {
        emit(SmsSearchDetailsReportingState.empty());
      }
    } catch (e) {
      
      emit(SmsSearchDetailsReportingState.error(e.toString()));
    }
  }
}

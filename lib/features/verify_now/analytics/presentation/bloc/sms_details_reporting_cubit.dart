import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/usecases/get_details_reporting_usecase.dart';

import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_details_reporting_state.dart';

class SmsDetailsReportingCubit extends Cubit<SmsDetailsReportingState> {
  final GetDetailsReportingUseCase getDetailsReportingUseCase;
  SmsDetailsReportingCubit(this.getDetailsReportingUseCase)
      : super(SmsDetailsReportingState.initial());

  void getDetailsReporting(
      {required String from,
      required String to,
      required String pageNo,
      required String size}) async {
    try {
      emit(SmsDetailsReportingState.loading());
      final dataState = await getDetailsReportingUseCase.call(
          pramas: DetailsReportingRequestPrams(
              customerId: LocalStateCache().customerId,
              from: from.trim(),
              pageNo: pageNo,
              size: size,
              type: "SMS",
              to: to.trim()));
    
      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data!.data != null) {
        emit(SmsDetailsReportingState.success(dataState.data!));
      }

      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data!.data == null) {
        emit(SmsDetailsReportingState.empty());
      }
    } catch (e) {
      
      emit(SmsDetailsReportingState.error(e.toString()));
    }
  }
}

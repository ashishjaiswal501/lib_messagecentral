import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/usecases/search_get_details_reporting_usecase.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/otp_search_details_reporting_state.dart';

class OtpSearchDetailsReportingCubit
    extends Cubit<OtpSearchDetailsReportingState> {
  final SearchGetDetailsReportingUseCase searchGetDetailsReportingUseCase;
  OtpSearchDetailsReportingCubit(this.searchGetDetailsReportingUseCase)
      : super(OtpSearchDetailsReportingState.initial());

  void otpGetDetailsReporting(
      {required String query,
      required String pageNo,
      required String size,
      required String type}) async {
    try {
      emit(OtpSearchDetailsReportingState.loading());

      final dataState = await searchGetDetailsReportingUseCase.call(
          pramas: SearchDetailsReportingRequestPrams(
        customerId: LocalStateCache().customerId,
        query: query.toString(),
        pageNo: pageNo,
        size: size,
        type: "OTP",
      ));
      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data!.data != null) {
        emit(OtpSearchDetailsReportingState.success(dataState.data!));
      }

      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data!.data == null) {
        emit(OtpSearchDetailsReportingState.empty());
      }

    } catch (e) {
     
      emit(OtpSearchDetailsReportingState.error(e.toString()));
    }
  }
}

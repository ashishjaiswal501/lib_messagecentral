import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:messagecentral/core/resources/data_state.dart';

import 'package:messagecentral/features/verify_now/dashboard/domain/usecases/get_dashboard_otp_usecase.dart';


import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_event.dart';

import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

  final GetDashboardOtpUsecase getDashboardOtpUsecase;

  DashboardBloc(
      {required this.getDashboardOtpUsecase})
      : super(const DashboardStateInitial()) {
  //  on<GetDashboardSmsEventCall>(_onDashboadSmsLoad);

    on<GetDashboardOtpEventCall>(_onDashboadOtpLoad);
  }

  void _onDashboadOtpLoad(
      GetDashboardOtpEventCall event, Emitter<DashboardState> emit) async {
    try {
      emit(const DashboardStateLoading());

      final dataState = await getDashboardOtpUsecase(
          pramas: DashboardOtpPrams(
              customerId: event.customerId!,
              fromDate: event.fromDate!,
              toDate: event.toDate, 
              authToken: event.authToken));

      if (dataState is DataSuccess && dataState.data != null) {
        emit(DashboardOtpStateSuccess(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(DashboardStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const DashboardStateInitial());
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:messagecentral/core/resources/data_state.dart';

import 'package:messagecentral/features/verify_now/dashboard/domain/usecases/get_dashboard_sms_usecase.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_sms_event.dart';

import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_sms_state.dart';



class DashboardSMSBloc extends Bloc<DashboardSMSEvent, DashboardSMSState> {
  final GetDashboardSmsUsecase getDashboardSmsUsecase;


  DashboardSMSBloc(
      {required this.getDashboardSmsUsecase,
     })
      : super(const DashboardSMSStateInitial()) {
    on<GetDashboardSmsEventCall>(_onDashboadSmsLoad);

    
  }

  void _onDashboadSmsLoad(
      GetDashboardSmsEventCall event, Emitter<DashboardSMSState> emit) async {
    try {
      emit(const DashboardSMSStateLoading());

      final dataState = await getDashboardSmsUsecase(
          pramas: DashboardSmsPrams(
              customerId: event.customerId!,
              fromDate: event.fromDate!,
              toDate: event.toDate,
              authToken: event.authToken));

      if (dataState is DataSuccess && dataState.data != null) {
        emit(DashboardSMSStateSuccess(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(DashboardSMSStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const DashboardSMSStateInitial());
    }
  }

  

}

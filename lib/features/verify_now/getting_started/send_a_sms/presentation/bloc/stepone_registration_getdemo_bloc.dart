import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/usecases/get_stepone_registration_getDemo_usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/stepone_registration_getdemo_event.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/stepone_registration_sgetdemo_state.dart';

class SteponeRegistrationGetDemoBloc
    extends Bloc<SteponeRegistrationGetDemoEvent, SteponeRegistrationGetState> {
  final GetSteponeRegistrationGetDemoUsecase steponeRegistrationUsecase;

  SteponeRegistrationGetDemoBloc({
    required this.steponeRegistrationUsecase,
  }) : super(const SteponeRegistrationGetStateInitial()) {
    on<SteponeRegistrationGetPressedButton>(_onGetDemoSms);
  }

  void _onGetDemoSms(SteponeRegistrationGetPressedButton event,
      Emitter<SteponeRegistrationGetState> emit) async {
    try {
      emit(const SteponeRegistrationGetStateLoading());
      final dataState = await steponeRegistrationUsecase(
        pramas: SteponeRegistrationGetPrams(
          customerId: LocalStateCache().customerId,
          authToken: LocalStateCache().authToken,
        ),
      );

      if (dataState is DataSuccess && dataState.data != null) {
        emit(SteponeRegistrationGetStateSuccess(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(SteponeRegistrationGetStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const SteponeRegistrationGetStateInitial());
    }
  }
}

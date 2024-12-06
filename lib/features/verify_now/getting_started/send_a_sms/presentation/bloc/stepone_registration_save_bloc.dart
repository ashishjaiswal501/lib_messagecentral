import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/usecases/stepone_registration_save_usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/stepone_registration_save_event.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/stepone_registration_save_state.dart';

class SteponeRegistrationSaveBloc
    extends Bloc<SteponeRegistrationSaveEvent, SteponeRegistrationSaveState> {
  final SteponeRegistrationSaveUsecase steponeRegistrationSaveUsecase;

  SteponeRegistrationSaveBloc({
    required this.steponeRegistrationSaveUsecase,
  }) : super(const SteponeRegistrationSaveStateInitial()) {
    on<SteponeRegistrationSavePressedButton>(_onSendASms);
  }

  void _onSendASms(SteponeRegistrationSavePressedButton event,
      Emitter<SteponeRegistrationSaveState> emit) async {
    try {
      emit(const SteponeRegistrationSaveStateLoading());
      final dataState = await steponeRegistrationSaveUsecase(
        pramas: SteponeRegistrationSavePrams(
      name: event.name!,
      companyName: event.companyName!,
      companyWebsite: event.companyWebsite!,
      workingEmail: event.workingEmail!,
      contactNumber: event.contactNumber!,
      countryToSendSMS: event.countryToSendSMS!,
      hasIndianRegisteredID: event.hasIndianRegisteredID!,
      usageDescription: event.usageDescription!,
      userAccountType: event.userAccountType!,
      userAddress: event.userAddress!,
      userCountry: event.userCountry!,
      userCity: event.userCity!,
      userState:event.userState!,
      userZipCode: event.userZipCode!,
      resellerType: event.resellerType!,
      authToken: event.authToken!,
        ),
      );

      if (dataState is DataSuccess && dataState.data != null) {
        emit(SteponeRegistrationSaveStateSuccess(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(SteponeRegistrationSaveStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const SteponeRegistrationSaveStateInitial());
    }
  }
}

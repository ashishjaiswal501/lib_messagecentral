import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/entity/stepone_register_save_entity.dart';

abstract class SteponeRegistrationSaveState extends Equatable {
  final SteponeRegisterSaveEntity? steponeRegisterSaveEntity;

  final String? dioError;
  final bool isSteponeRegisterSaveSuccess;

  const SteponeRegistrationSaveState({
    this.steponeRegisterSaveEntity,
    this.dioError,
    this.isSteponeRegisterSaveSuccess = false,
  });

  @override
  List<Object?> get props => [steponeRegisterSaveEntity, dioError];
}

class SteponeRegistrationSaveStateInitial extends SteponeRegistrationSaveState {
  const SteponeRegistrationSaveStateInitial()
      : super(
          isSteponeRegisterSaveSuccess: false,
        );
}

class BacktoPreviousStateInitial extends SteponeRegistrationSaveState {
  const BacktoPreviousStateInitial()
      : super(
          isSteponeRegisterSaveSuccess: false,
        );
}

class SteponeRegistrationSaveStateLoading extends SteponeRegistrationSaveState {
  const SteponeRegistrationSaveStateLoading()
      : super(
          isSteponeRegisterSaveSuccess: false,
        );
}

class SteponeRegistrationSaveStateSuccess extends SteponeRegistrationSaveState {
  const SteponeRegistrationSaveStateSuccess(
      SteponeRegisterSaveEntity steponeRegisterSaveEntity)
      : super(
          steponeRegisterSaveEntity: steponeRegisterSaveEntity,
          isSteponeRegisterSaveSuccess: true,
        );
}

class SteponeRegistrationSaveStateError extends SteponeRegistrationSaveState {
  const SteponeRegistrationSaveStateError(String dioError)
      : super(
          dioError: dioError,
          isSteponeRegisterSaveSuccess: true,
        );
}

import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/entity/stepone_register_save_entity.dart';

abstract class SteponeRegistrationGetState extends Equatable {
  final SteponeRegisterSaveEntity? steponeRegisterSaveEntity;

  final String? dioError;

  const SteponeRegistrationGetState({
    this.steponeRegisterSaveEntity,
    this.dioError,
  });

  @override
  List<Object?> get props => [steponeRegisterSaveEntity, dioError];
}

class SteponeRegistrationGetStateInitial extends SteponeRegistrationGetState {
  const SteponeRegistrationGetStateInitial();
}

class SteponeRegistrationGetStateLoading extends SteponeRegistrationGetState {
  const SteponeRegistrationGetStateLoading();
}

class SteponeRegistrationGetStateSuccess extends SteponeRegistrationGetState {
  const SteponeRegistrationGetStateSuccess(
      SteponeRegisterSaveEntity steponeRegisterSaveEntity)
      : super(steponeRegisterSaveEntity: steponeRegisterSaveEntity);
}

class SteponeRegistrationGetStateError extends SteponeRegistrationGetState {
  const SteponeRegistrationGetStateError(String dioError)
      : super(dioError: dioError);
}

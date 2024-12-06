import 'package:equatable/equatable.dart';

abstract class SteponeRegistrationGetDemoEvent extends Equatable {
  const SteponeRegistrationGetDemoEvent();

  @override
  List<Object> get props => [];
}

class SteponeRegistrationGetPressedButton
    extends SteponeRegistrationGetDemoEvent {
  const SteponeRegistrationGetPressedButton();
}

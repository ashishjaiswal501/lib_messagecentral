
import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/login/domain/entity/login_enity.dart';

abstract class LoginState extends Equatable {
  final LoginEntity? loginEntity;
  final String? dioError;
  final bool? isobscureText;

  const LoginState({
    this.loginEntity,
    this.dioError,
    this.isobscureText = true,
  });

  @override
  List<Object?> get props => [loginEntity, dioError, isobscureText];
}

class LoginStateInitial extends LoginState {
  const LoginStateInitial();
}

class LoginStateLoading extends LoginState {
  const LoginStateLoading();
}

class LoginStateSuccess extends LoginState {
  const LoginStateSuccess(
    LoginEntity loginEntity,
  ) : super(loginEntity: loginEntity);
}

class LoginStateError extends LoginState {
  const LoginStateError(String dioError) : super(dioError: dioError);
}

class ObscureTextVisibilityState extends LoginState {
  const ObscureTextVisibilityState(bool isobscureText)
      : super(isobscureText: isobscureText);
}

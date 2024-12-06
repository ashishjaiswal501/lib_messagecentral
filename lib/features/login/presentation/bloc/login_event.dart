import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class GetLoginPressedButton extends LoginEvent {
  final String? email;
  final String? password;

  const GetLoginPressedButton({required this.email, required this.password,});
}


class GetobscureTextVisibility extends LoginEvent{
 
  final bool obscureText;
 const GetobscureTextVisibility({this.obscureText=true});

}


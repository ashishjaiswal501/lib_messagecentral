import 'package:equatable/equatable.dart';

class UpdatePasswordEvent extends Equatable {
  const UpdatePasswordEvent();
  @override
  List<Object?> get props => [];
}

class GetUpdatePasswordPressed extends UpdatePasswordEvent {
  final String? newPassword;
  final String? oldPassword;
  

  const GetUpdatePasswordPressed({
  this.newPassword='',
  this.oldPassword='',
  });
}

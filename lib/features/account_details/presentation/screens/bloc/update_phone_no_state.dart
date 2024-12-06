import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/account_details/domain/enitity/update_phone_number_entity.dart';

class UpdatePhoneNoState extends Equatable {
  final UpdatePhoneNumberEntity? updatePhoneNumberEntity;
  final String? dioError;
  const UpdatePhoneNoState({this.updatePhoneNumberEntity, this.dioError});
  @override
  List<Object?> get props => [updatePhoneNumberEntity, dioError];
}

class UpdatePhoneNoStateInitial extends UpdatePhoneNoState {
 const UpdatePhoneNoStateInitial();
}
class UpdatePhoneNoStateLoading extends UpdatePhoneNoState {
 const UpdatePhoneNoStateLoading();
}
class UpdatePhoneNoStateError extends UpdatePhoneNoState {
 const UpdatePhoneNoStateError(String dioError) : super(dioError: dioError);
}
class UpdatePhoneNoStateSuccess extends UpdatePhoneNoState {
 const UpdatePhoneNoStateSuccess( UpdatePhoneNumberEntity updatePhoneNumberEntity) : super(updatePhoneNumberEntity: updatePhoneNumberEntity);
}
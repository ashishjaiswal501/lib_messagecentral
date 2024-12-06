import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/account_details/domain/enitity/update_phone_number_entity.dart';

class UpdatePhoneNoGetOtpState extends Equatable {
  final UpdatePhoneNumberEntity? updatePhoneNumberEntity;
  final String? dioError;
  const UpdatePhoneNoGetOtpState({this.updatePhoneNumberEntity, this.dioError});
  @override
  List<Object?> get props => [updatePhoneNumberEntity, dioError];
}

class UpdatePhoneNoGetOtpStateInitial extends UpdatePhoneNoGetOtpState {
 const UpdatePhoneNoGetOtpStateInitial();
}
class UpdatePhoneNoGetOtpStateLoading extends UpdatePhoneNoGetOtpState {
 const UpdatePhoneNoGetOtpStateLoading();
}
class UpdatePhoneNoGetOtpStateError extends UpdatePhoneNoGetOtpState {
 const UpdatePhoneNoGetOtpStateError(String dioError) : super(dioError: dioError);
}
class UpdatePhoneNoGetOtpStateSuccess extends UpdatePhoneNoGetOtpState {
 const UpdatePhoneNoGetOtpStateSuccess( UpdatePhoneNumberEntity updatePhoneNumberEntity) : super(updatePhoneNumberEntity: updatePhoneNumberEntity);
}
import 'package:equatable/equatable.dart';

class UpdatePhoneNoGetOtpEvent extends Equatable {
  const UpdatePhoneNoGetOtpEvent();
  @override
  List<Object?> get props => [];
}

class GetUpdatePhoneNoGetOtpPressed extends UpdatePhoneNoGetOtpEvent {
  final String phoneNumber;
  final String countryCode;

  const GetUpdatePhoneNoGetOtpPressed({
    this.countryCode = '',
    this.phoneNumber = '',
  });
}

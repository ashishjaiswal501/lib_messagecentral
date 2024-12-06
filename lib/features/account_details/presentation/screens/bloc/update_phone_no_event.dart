import 'package:equatable/equatable.dart';

class UpdatePhoneNoEvent extends Equatable {
  const UpdatePhoneNoEvent();
  @override
  List<Object?> get props => [];
}

class GetUpdatePhoneNoPressed extends UpdatePhoneNoEvent {
  final String phoneNumber;
  final String countryCode;
  
  final String customerId;
  final String otp;
  final String verificationId;
  const GetUpdatePhoneNoPressed({
    this.countryCode='',
    this.customerId='',
    this.otp='',
    this.phoneNumber='',
    this.verificationId=''
  });
}

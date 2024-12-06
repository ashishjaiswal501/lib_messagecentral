import 'package:equatable/equatable.dart';

abstract class SteponeRegistrationSaveEvent extends Equatable {
  const SteponeRegistrationSaveEvent();

  @override
  List<Object> get props => [];
}

class SteponeRegistrationSavePressedButton
    extends SteponeRegistrationSaveEvent {
  final String? name;
  final String? companyName;
  final String? companyWebsite;
  final String? workingEmail;
  final String? contactNumber;
  final String? countryToSendSMS;
  final bool? hasIndianRegisteredID;
  final String? usageDescription;
  final String? userAccountType;
  final String? userAddress;
  final String? userCountry;
  final String? userCity;
  final String? userState;
  final String? userZipCode;
  final bool? resellerType;
  final String? authToken;

  const SteponeRegistrationSavePressedButton(
      {
   required this.name,
   required this.companyName,
   required this.companyWebsite,
   required this.workingEmail,
   required this.contactNumber,
   required this.countryToSendSMS,
   required this.hasIndianRegisteredID,
   required this.usageDescription,
   required this.userAccountType,
   required this.userAddress,
   required this.userCountry,
   required this.userCity,
   required this.userState,
   required this.userZipCode,
   required this.resellerType,
   required this.authToken,
      });
}

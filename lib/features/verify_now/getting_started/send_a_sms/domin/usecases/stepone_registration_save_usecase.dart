import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/entity/stepone_register_save_entity.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/repository/stepone_register_save_repository.dart';

part 'stepone_registration_save_usecase.g.dart';

class SteponeRegistrationSaveUsecase
    implements
        UseCase<DataState<SteponeRegisterSaveEntity>,
            SteponeRegistrationSavePrams> {
  final SteponeRegisterSaveRepository steponeRegisterSaveRepository;
  SteponeRegistrationSaveUsecase({required this.steponeRegisterSaveRepository});

  @override
  Future<DataState<SteponeRegisterSaveEntity>> call(
      {SteponeRegistrationSavePrams? pramas}) {
    return steponeRegisterSaveRepository.steponeRegisterSaveApi(
      name: pramas!.name,
      companyName: pramas.companyName,
      companyWebsite: pramas.companyWebsite,
      workingEmail: pramas.workingEmail,
      contactNumber: pramas.contactNumber,
      countryToSendSMS: pramas.countryToSendSMS,
      hasIndianRegisteredID: pramas.hasIndianRegisteredID,
      usageDescription: pramas.usageDescription,
      userAccountType: pramas.userAccountType,
      userAddress: pramas.userAddress,
      userCountry: pramas.userCountry,
      userCity: pramas.userCity,
      userState:pramas.userState,
      userZipCode: pramas.userZipCode,
      resellerType: pramas.resellerType,
      authToken: pramas.authToken,
    );
  }
}

@JsonSerializable()
class SteponeRegistrationSavePrams {
  String name;
  String companyName;
  String companyWebsite;
  String workingEmail;
  String contactNumber;
  String countryToSendSMS;
  bool hasIndianRegisteredID;
  String usageDescription;
  String userAccountType;
  String userAddress;
  String userCountry;
  String userCity;
  String userState;
  String userZipCode;
  bool resellerType;
  String authToken;

  SteponeRegistrationSavePrams({
   this.name = '',
   this.companyName = '',
   this.companyWebsite = '',
   this.workingEmail = '',
   this.contactNumber = '',
   this.countryToSendSMS = '',
   this.hasIndianRegisteredID = true,
   this.usageDescription = '',
   this.userAccountType = '',
   this.userAddress = '',
   this.userCountry = '',
   this.userCity = '',
   this.userState='',
   this.userZipCode = '',
   this.resellerType = false,
   this.authToken = '',
  });

  factory SteponeRegistrationSavePrams.fromJson(Map<String, dynamic> json) =>
      _$SteponeRegistrationSavePramsFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SteponeRegistrationSavePramsToJson(this);
}

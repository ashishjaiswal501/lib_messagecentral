import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/entity/stepone_register_save_entity.dart';

abstract class SteponeRegisterSaveRepository {
  Future<DataState<SteponeRegisterSaveEntity>> steponeRegisterSaveApi({
    required String name,
    required String companyName,
    required String companyWebsite,
    required String workingEmail,
    required String contactNumber,
    required String countryToSendSMS,
    required bool hasIndianRegisteredID,
    required String usageDescription,
    required String userAccountType,
    required String userAddress,
    required String userCountry,
    required String userCity,
    required String userState,
    required String userZipCode,
    required bool resellerType,
    required String authToken
  });
   Future<DataState<SteponeRegisterSaveEntity>> steponeRegisterGetDemo({
    required String customerId, required String authToken
   
  });
}

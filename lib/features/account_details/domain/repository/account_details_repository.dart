import 'package:messagecentral/features/account_details/domain/enitity/update_phone_number_entity.dart';
import 'package:messagecentral/features/account_details/domain/usecases/get_account_details_usecase.dart';
import 'package:messagecentral/features/find_by_customer_id/domain/entity/find_by_customer_id_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class AccountDetailsRepository {
  Future<DataState<FindByCustomerIdEntity>> updatePassword(
      {String newPassword='',
      String oldPassword='',
      String customerId='',
      String authToken=''});
  Future<DataState<UpdatePhoneNumberEntity>> updatePhoneNumberGetOtp(
      {String phoneNumber='', String countryCode='', String authToken=''});
 
 
 
 
  Future<DataState<UpdatePhoneNumberEntity>> updatePhoneNumber({
    String phoneNumber='',
    String countryCode='',
    String authToken='',
    String customerId='',
    String otp='',
    String verificationId='',
  });

  Future<DataState<FindByCustomerIdEntity>> updateAccountDetails(
      {AccountDetailsRequest? accountDetailsRequest});
}

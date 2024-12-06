import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/entity/send_a_sms_enity.dart';

abstract class SendASmsRepository {
  Future<DataState<SendASmsEntity>> sendASmsApi({
    required String customerId,
    required String mobileNumber,
    required String countryCode,
    required String flowType,
    required String type,
    required String senderId,
    required String message,
    required String authToken,
  });
}

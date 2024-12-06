import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/entity/send_a_sms_enity.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/repository/send_a_sms_repository.dart';

part 'send_a_sms_usecase.g.dart';

class SendASmsUsecase
    implements UseCase<DataState<SendASmsEntity>, SendASmsPrams> {
  final SendASmsRepository sendASmsRepository;
  SendASmsUsecase({required this.sendASmsRepository});

  @override
  Future<DataState<SendASmsEntity>> call({SendASmsPrams? pramas}) {
    return sendASmsRepository.sendASmsApi(
        customerId: pramas!.customerId,
        mobileNumber: pramas.mobileNumber,
        countryCode: pramas.countryCode,
        flowType: pramas.flowType,
        type: pramas.type,
        senderId: pramas.senderId,
        message: pramas.message,
        authToken: pramas.authToken);
  }
}

@JsonSerializable()
class SendASmsPrams {
  String customerId;
  String mobileNumber;
  String countryCode;
  String flowType;
  String type;
  String senderId;
  String message;
  String authToken;

  SendASmsPrams(
      {this.customerId = '',
      this.mobileNumber = '',
      this.countryCode = '',
      this.flowType = '',
      this.type = '',
      this.senderId = '',
      this.message = '',
      this.authToken = '',
          });

  factory SendASmsPrams.fromJson(Map<String, dynamic> json) =>
      _$SendASmsPramsFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SendASmsPramsToJson(this);
}

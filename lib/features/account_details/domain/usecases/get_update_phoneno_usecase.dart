import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/account_details/domain/enitity/update_phone_number_entity.dart';
import 'package:messagecentral/features/account_details/domain/repository/account_details_repository.dart';

import '../../../../core/resources/data_state.dart';
part 'get_update_phoneno_usecase.g.dart';

class GetUpdatePhoneNoUseCase
    implements
        UseCase<DataState<UpdatePhoneNumberEntity>, UpdatePhoneNoRequest> {
  final AccountDetailsRepository accountDetailsRepository;
  GetUpdatePhoneNoUseCase(this.accountDetailsRepository);
  @override
  Future<DataState<UpdatePhoneNumberEntity>> call(
      {UpdatePhoneNoRequest? pramas}) async {
    return accountDetailsRepository.updatePhoneNumber(
        phoneNumber: pramas!.phoneNumber!,
        countryCode: pramas.countryCode!,
        customerId: pramas.countryCode!,
        verificationId: pramas.verificationId!,
        otp: pramas.otp!);
  }
}

@JsonSerializable()
class UpdatePhoneNoRequest {
  String? phoneNumber;
  String? verificationId;
  String? otp;

  String? countryCode;
  String? customerId;

  UpdatePhoneNoRequest({
    this.customerId = '',
    this.phoneNumber = '',
    this.otp = '',
    this.countryCode = '',
    this.verificationId = '',
  });

  factory UpdatePhoneNoRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePhoneNoRequestFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UpdatePhoneNoRequestToJson(this);
}

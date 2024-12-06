import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/account_details/domain/enitity/update_phone_number_entity.dart';
import 'package:messagecentral/features/account_details/domain/repository/account_details_repository.dart';

import '../../../../core/resources/data_state.dart';
 part 'get_update_phoneno_otp_usecase.g.dart';

class GetUpdatePhoneNoOtpUseCase
    implements
        UseCase<DataState<UpdatePhoneNumberEntity>, UpdatePhoneNoOtpRequest> {
  final AccountDetailsRepository accountDetailsRepository;
  GetUpdatePhoneNoOtpUseCase(this.accountDetailsRepository);
  @override
  Future<DataState<UpdatePhoneNumberEntity>> call(
      {UpdatePhoneNoOtpRequest? pramas}) async {
    return await accountDetailsRepository.updatePhoneNumberGetOtp(
      phoneNumber: pramas!.phoneNumber!,
      countryCode: pramas.countryCode!,
    );
  }
}

@JsonSerializable()
class UpdatePhoneNoOtpRequest {
  String? phoneNumber;

  String? countryCode;

  UpdatePhoneNoOtpRequest({
    this.phoneNumber = '',
    this.countryCode = '',
  });

  factory UpdatePhoneNoOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePhoneNoOtpRequestFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UpdatePhoneNoOtpRequestToJson(this);
}

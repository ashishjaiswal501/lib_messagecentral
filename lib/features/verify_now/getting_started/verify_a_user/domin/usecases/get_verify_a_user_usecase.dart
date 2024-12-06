import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_enity.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/repository/verify_a_user_repository.dart';

part 'get_verify_a_user_usecase.g.dart';

class GetVerifyAUserUsecase
    implements UseCase<DataState<VerifyAUserEntity>, VerifyAUserPrams> {
  final VerifyAUserRepository verifyAUserRepository;
  GetVerifyAUserUsecase({required this.verifyAUserRepository});

  @override
  Future<DataState<VerifyAUserEntity>> call({VerifyAUserPrams? pramas}) {
    return verifyAUserRepository.verifyAUserApi(
        flowType: pramas!.flowType,
        customerId: pramas.customerId,
        countryCode: pramas.countryCode,
        mobileNumber: pramas.mobileNumber,
        authToken: pramas.authToken);
  }
}

@JsonSerializable()
class VerifyAUserPrams {
  String flowType;
  String customerId;
  String countryCode;
  String mobileNumber;
  String authToken;

  VerifyAUserPrams(
      {this.flowType = '',
      this.customerId = '',
      this.countryCode = '',
      this.mobileNumber = '',
      this.authToken = ''});

  factory VerifyAUserPrams.fromJson(Map<String, dynamic> json) =>
      _$VerifyAUserPramsFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$VerifyAUserPramsToJson(this);
}

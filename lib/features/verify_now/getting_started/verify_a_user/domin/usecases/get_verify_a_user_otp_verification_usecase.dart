// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_otp_verification_entity.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/repository/verify_a_user_repository.dart';
part 'get_verify_a_user_otp_verification_usecase.g.dart';

class GetVerifyAUserOtpVerificationUsecase
    implements
        UseCase<DataState<VerifyAUserOtpVerificationEntity>,
            VerifyAUserOtpVerificationPrams> {
  final VerifyAUserRepository verifyAUserRepository;
  GetVerifyAUserOtpVerificationUsecase({required this.verifyAUserRepository});

  @override
  Future<DataState<VerifyAUserOtpVerificationEntity>> call(
      {VerifyAUserOtpVerificationPrams? pramas}) {
    return verifyAUserRepository.verifyAUserOtpVerificationApi(
        code: pramas!.code,
        customerId: pramas.customerId,
        verificationId: pramas.verificationId,
        authToken: pramas.authToken,
        
        );
  }
}

@JsonSerializable()
class VerifyAUserOtpVerificationPrams {
  String code;
  String customerId;
  String verificationId;
  String authToken;

  VerifyAUserOtpVerificationPrams(
      {this.code = '', this.customerId = '', this.verificationId = '',this.authToken=''});

  factory VerifyAUserOtpVerificationPrams.fromJson(Map<String, dynamic> json) =>
      _$VerifyAUserOtpVerificationPramsFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() =>
      _$VerifyAUserOtpVerificationPramsToJson(this);
}

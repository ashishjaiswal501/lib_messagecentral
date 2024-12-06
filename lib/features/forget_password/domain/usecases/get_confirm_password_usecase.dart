import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/features/forget_password/domain/entity/confirm_password_entity.dart';
import 'package:messagecentral/features/forget_password/domain/repository/forget_password_repository.dart';


import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
part 'get_confirm_password_usecase.g.dart';

class GetConfirmPasswordUsecase
    implements
        UseCase<DataState<ConfirmPasswordEntity>, ConfirmPasswordRequestPrams> {
  final ForgetPasswordRepository forgetPasswordRepository;
  GetConfirmPasswordUsecase({required this.forgetPasswordRepository});

  @override
  Future<DataState<ConfirmPasswordEntity>> call(
      {ConfirmPasswordRequestPrams? pramas}) {
    return forgetPasswordRepository.forgetConfirmPaasword(
      email: pramas!.email, newPassword: pramas.newPassword, authToken: pramas.authToken
        );
  }
}

@JsonSerializable()
class ConfirmPasswordRequestPrams {
  String email;
  String newPassword;
String authToken;

  ConfirmPasswordRequestPrams(
      {this.email = '', this.newPassword = '', this.authToken=''});

  factory ConfirmPasswordRequestPrams.fromJson(Map<String, dynamic> json) =>
      _$ConfirmPasswordRequestPramsFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ConfirmPasswordRequestPramsToJson(this);
}

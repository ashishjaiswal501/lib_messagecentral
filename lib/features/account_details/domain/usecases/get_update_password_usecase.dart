import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/account_details/domain/repository/account_details_repository.dart';
import 'package:messagecentral/features/find_by_customer_id/domain/entity/find_by_customer_id_entity.dart';

import '../../../../core/resources/data_state.dart';
part 'get_update_password_usecase.g.dart';

class GetUpdatePasswordUseCase
    implements
        UseCase<DataState<FindByCustomerIdEntity>, ConfirmPasswordRequest> {
  final AccountDetailsRepository accountDetailsRepository;
  GetUpdatePasswordUseCase(this.accountDetailsRepository);
  @override
  Future<DataState<FindByCustomerIdEntity>> call(
      {ConfirmPasswordRequest? pramas}) async {
    return await accountDetailsRepository.updatePassword(
      newPassword: pramas!.newPassword!,
      oldPassword: pramas.oldPassword!,
      customerId: pramas.customerId!,
    );
  }
}

@JsonSerializable()
class ConfirmPasswordRequest {
  String? newPassword;
  String? oldPassword;

  String? customerId;

  ConfirmPasswordRequest({
    this.customerId = '',
    this.newPassword = '',
    this.oldPassword = '',
  });

  factory ConfirmPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmPasswordRequestFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ConfirmPasswordRequestToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/account_details/domain/repository/account_details_repository.dart';
import 'package:messagecentral/features/find_by_customer_id/domain/entity/find_by_customer_id_entity.dart';

import '../../../../core/resources/data_state.dart';
part 'get_account_details_usecase.g.dart';

class GetAccountDetailsUseCase
    implements
        UseCase<DataState<FindByCustomerIdEntity>, AccountDetailsRequest> {
  final AccountDetailsRepository accountDetailsRepository;
  GetAccountDetailsUseCase(this.accountDetailsRepository);
  @override
  Future<DataState<FindByCustomerIdEntity>> call(
      {AccountDetailsRequest? pramas})async {
    return await accountDetailsRepository.updateAccountDetails(
        accountDetailsRequest: pramas);
  }
}

@JsonSerializable()
class AccountDetailsRequest {
  String? firstName;
  String? address;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  String? customerId;
  String? lastName;
  String? email;

  AccountDetailsRequest({
    this.customerId = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.address = '',
    this.city = '',
    this.country = '',
    this.postalCode = '',
    this.state = '',
  });

  factory AccountDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsRequestFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AccountDetailsRequestToJson(this);
}

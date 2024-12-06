
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/find_by_customer_id/domain/entity/find_by_customer_id_entity.dart';
import 'package:messagecentral/features/find_by_customer_id/domain/repository/find_by_customer_id_repository.dart';
part 'find_by_customer_id_usecase.g.dart';

class FindByCustomerIdUsecase
    implements
        UseCase<DataState<FindByCustomerIdEntity>,
            FindByCustomerIdPrams> {
  final FindByCustomerIdRepository findByCustomerIdRepository;
  FindByCustomerIdUsecase({required this.findByCustomerIdRepository});

  @override
  Future<DataState<FindByCustomerIdEntity>> call(
      {FindByCustomerIdPrams? pramas}) {
    return findByCustomerIdRepository.findByCustomerId(
        customerId: pramas!.customerId,
        authToken: pramas.authToken,
        
        );
  }
}

@JsonSerializable()
class FindByCustomerIdPrams {
  String customerId;
  String authToken;

  FindByCustomerIdPrams(
      { this.customerId = '',this.authToken=''});

  factory FindByCustomerIdPrams.fromJson(Map<String, dynamic> json) =>
      _$FindByCustomerIdPramsFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() =>
      _$FindByCustomerIdPramsToJson(this);
}

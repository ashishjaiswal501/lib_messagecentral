import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/find_by_customer_id/domain/entity/find_by_customer_id_entity.dart';

class AccountDetailsState extends Equatable {
  final FindByCustomerIdEntity? findByCustomerIdEntity;
  final String? dioError;
  const AccountDetailsState({this.findByCustomerIdEntity, this.dioError});
  @override
  List<Object?> get props => [findByCustomerIdEntity, dioError];
}

class AccountDetailsStateInitial extends AccountDetailsState {
 const AccountDetailsStateInitial();
}
class AccountDetailsStateLoading extends AccountDetailsState {
 const AccountDetailsStateLoading();
}
class AccountDetailsStateError extends AccountDetailsState {
 const AccountDetailsStateError(String dioError) : super(dioError: dioError);
}
class AccountDetailsStateSuccess extends AccountDetailsState {
 const AccountDetailsStateSuccess( FindByCustomerIdEntity findByCustomerIdEntity) : super(findByCustomerIdEntity: findByCustomerIdEntity);
}

import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/find_by_customer_id/domain/entity/find_by_customer_id_entity.dart';

class FindByCustomerIdState extends Equatable {
  final FindByCustomerIdEntity? findByCustomerIdEntity;
  final String? dioError;
  const FindByCustomerIdState({this.findByCustomerIdEntity, this.dioError});
  @override
  List<Object?> get props => [findByCustomerIdEntity];
}

class FindByCustomerIdStateInitial extends FindByCustomerIdState {
  const FindByCustomerIdStateInitial();
}

class FindByCustomerIdStateLoading extends FindByCustomerIdState {
  const FindByCustomerIdStateLoading();
}

class FindByCustomerIdStateError extends FindByCustomerIdState {
  const FindByCustomerIdStateError(String dioError) : super(dioError: dioError);
}

class FindByCustomerIdStateSuccess extends FindByCustomerIdState {
  const FindByCustomerIdStateSuccess(
    FindByCustomerIdEntity findByCustomerIdEntity,
  ) : super(findByCustomerIdEntity: findByCustomerIdEntity);
}

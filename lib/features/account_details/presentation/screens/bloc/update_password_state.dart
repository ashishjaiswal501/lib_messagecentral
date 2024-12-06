import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/find_by_customer_id/domain/entity/find_by_customer_id_entity.dart';

class UpdatePasswordState extends Equatable {
  final FindByCustomerIdEntity? findByCustomerIdEntity;
  final String? dioError;
  const UpdatePasswordState({this.findByCustomerIdEntity, this.dioError});
  @override
  List<Object?> get props => [findByCustomerIdEntity, dioError];
}

class UpdatePasswordStateInitial extends UpdatePasswordState {
 const UpdatePasswordStateInitial();
}
class UpdatePasswordStateLoading extends UpdatePasswordState {
 const UpdatePasswordStateLoading();
}
class UpdatePasswordStateError extends UpdatePasswordState {
 const UpdatePasswordStateError(String dioError) : super(dioError: dioError);
}
class UpdatePasswordStateSuccess extends UpdatePasswordState {
 const UpdatePasswordStateSuccess( FindByCustomerIdEntity findByCustomerIdEntity) : super(findByCustomerIdEntity: findByCustomerIdEntity);
}
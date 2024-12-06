import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_update_brand_name_entity.dart';

abstract class VerifyBrandNameState extends Equatable {
  final VerifyAUserUpdateBrandNameEntity? verifyAUserUpdateBrandNameEntity;

  final String? dioError;

  const VerifyBrandNameState({
    this.verifyAUserUpdateBrandNameEntity,
    this.dioError,
  });

  @override
  List<Object?> get props => [verifyAUserUpdateBrandNameEntity, dioError];
}
class VerifyAUserUpdateBrandNameStateInitial extends VerifyBrandNameState {
  const VerifyAUserUpdateBrandNameStateInitial();
}
class VerifyAUserUpdateBrandNameStateLoading extends VerifyBrandNameState {
  const VerifyAUserUpdateBrandNameStateLoading();
}

class VerifyAUserUpdateBrandNameStateSuccess extends VerifyBrandNameState {
  const VerifyAUserUpdateBrandNameStateSuccess(
      VerifyAUserUpdateBrandNameEntity verifyAUserUpdateBrandNameEntity)
      : super(
          verifyAUserUpdateBrandNameEntity: verifyAUserUpdateBrandNameEntity,
        );
}

class VerifyAUserUpdateBrandNameStateError extends VerifyBrandNameState {
  const VerifyAUserUpdateBrandNameStateError(String dioError)
      : super(
          dioError: dioError,
        );
}

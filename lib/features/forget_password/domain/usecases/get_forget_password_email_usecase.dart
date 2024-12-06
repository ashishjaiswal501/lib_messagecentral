
import 'package:messagecentral/features/forget_password/domain/entity/forget_password_email_entity.dart';
import 'package:messagecentral/features/forget_password/domain/repository/forget_password_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';

class GetForgetPasswordEmailUsecase
    implements UseCase<DataState<ForgetPasswordEmailEntity>, String> {
  final ForgetPasswordRepository forgetPasswordRepository;
  GetForgetPasswordEmailUsecase({required this.forgetPasswordRepository});

 @override
  Future<DataState<ForgetPasswordEmailEntity>> call({String? pramas}) {
   return forgetPasswordRepository.forgetPasswordWithEmail(email: pramas!);
  }

}

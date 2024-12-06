
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/login/domain/entity/login_enity.dart';
import 'package:messagecentral/features/login/domain/usecases/get_login_usecase.dart';

abstract class LoginRepository {
  Future<DataState<LoginEntity>> login({required LoginRequestPrams loginRequestPrams});

}
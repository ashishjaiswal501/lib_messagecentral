

// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/login/domain/entity/login_enity.dart';
import 'package:messagecentral/features/login/domain/repository/login_repository.dart';
 part 'get_login_usecase.g.dart';
 
class GetLoginUsecase implements UseCase<DataState<LoginEntity>, LoginRequestPrams> {
final LoginRepository loginRepository;
GetLoginUsecase(this.loginRepository);

  @override
  Future<DataState<LoginEntity>> call({LoginRequestPrams? pramas}) {
   return loginRepository.login(loginRequestPrams: pramas!);
  }
}


@JsonSerializable()
class LoginRequestPrams{
 
  String email;
  String password;

LoginRequestPrams({ this.email='', this.password=''});

 factory LoginRequestPrams.fromJson(Map<String, dynamic> json) => _$LoginRequestPramsFromJson(json);

 // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LoginRequestPramsToJson(this);
}
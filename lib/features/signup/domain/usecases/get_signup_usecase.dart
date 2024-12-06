

// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/signup/domain/entity/signup_enity.dart';
import 'package:messagecentral/features/signup/domain/repository/signup_repository.dart';
 part 'get_signup_usecase.g.dart';
 
class GetSignupUsecase implements UseCase<DataState<SignupEntity>, SignupRequestPrams> {
final SignupRepository signupRepository;
GetSignupUsecase(this.signupRepository);

  @override
  Future<DataState<SignupEntity>> call({SignupRequestPrams? pramas}) {
   return signupRepository.signup(signupRequestPrams: pramas!);
  }
}


@JsonSerializable()
class SignupRequestPrams{
 
  String fullName;
  String email;
  String password;

SignupRequestPrams({ this.fullName='',this.email='', this.password=''});

 factory SignupRequestPrams.fromJson(Map<String, dynamic> json) => _$SignupRequestPramsFromJson(json);

 // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SignupRequestPramsToJson(this);
}
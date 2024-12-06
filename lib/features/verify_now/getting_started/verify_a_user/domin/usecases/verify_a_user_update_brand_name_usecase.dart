// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_update_brand_name_entity.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/repository/verify_a_user_repository.dart';
part 'verify_a_user_update_brand_name_usecase.g.dart';

class GetVerifyAUserUpdateBrandNameUsecase
    implements
        UseCase<DataState<VerifyAUserUpdateBrandNameEntity>,
            VerifyAUserUpdateBrandNamePrams> {
  final VerifyAUserRepository verifyAUserRepository;
  GetVerifyAUserUpdateBrandNameUsecase({required this.verifyAUserRepository});

  @override
  Future<DataState<VerifyAUserUpdateBrandNameEntity>> call(
      {VerifyAUserUpdateBrandNamePrams? pramas}) {
    return verifyAUserRepository.verifyAUserUpdateBrandNameApi(
        brandName: pramas!.brandName,
        customerId: pramas.customerId,
        authToken: pramas.authToken,
        
        );
  }
}

@JsonSerializable()
class VerifyAUserUpdateBrandNamePrams {
  String brandName;
  String customerId;
  String authToken;

  VerifyAUserUpdateBrandNamePrams(
      {this.brandName = '', this.customerId = '',this.authToken=''});

  factory VerifyAUserUpdateBrandNamePrams.fromJson(Map<String, dynamic> json) =>
      _$VerifyAUserUpdateBrandNamePramsFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() =>
      _$VerifyAUserUpdateBrandNamePramsToJson(this);
}

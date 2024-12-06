// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/entity/stepone_register_save_entity.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/repository/stepone_register_save_repository.dart';

part 'get_stepone_registration_getDemo_usecase.g.dart';

class GetSteponeRegistrationGetDemoUsecase
    implements
        UseCase<DataState<SteponeRegisterSaveEntity>,
            SteponeRegistrationGetPrams> {
  final SteponeRegisterSaveRepository steponeRegisterSaveRepository;
  GetSteponeRegistrationGetDemoUsecase(
      {required this.steponeRegisterSaveRepository});

  @override
  Future<DataState<SteponeRegisterSaveEntity>> call(
      {SteponeRegistrationGetPrams? pramas}) {
    return steponeRegisterSaveRepository.steponeRegisterGetDemo(
      customerId: pramas!.customerId,
      authToken: pramas.authToken,
    );
  }
}

@JsonSerializable()
class SteponeRegistrationGetPrams {
  String customerId;

  String authToken;

  SteponeRegistrationGetPrams({
    this.customerId = '',
    this.authToken = '',
  });

  factory SteponeRegistrationGetPrams.fromJson(Map<String, dynamic> json) =>
      _$SteponeRegistrationGetPramsFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SteponeRegistrationGetPramsToJson(this);
}

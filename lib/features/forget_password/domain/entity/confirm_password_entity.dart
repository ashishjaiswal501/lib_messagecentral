

import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirm_password_entity.freezed.dart';

@freezed
class ConfirmPasswordEntity with _$ConfirmPasswordEntity {
  const factory ConfirmPasswordEntity({
    int? responseCode,
    String? message,
    ConfirmPaasswordData? data,
  }) = _ConfirmPasswordEntity;
}

@freezed
class ConfirmPaasswordData with _$ConfirmPaasswordData {
  const factory ConfirmPaasswordData({
    String? customerId,
    String? firstName,
    dynamic lastName,
    String? email,
    String? password,
    String? phoneCode,
    String? phoneNo,
    dynamic application,
    dynamic wallet,
    dynamic authToken,
    DateTime? createdDateTime,
    dynamic updatedDateTime,
    dynamic address,
    dynamic city,
    dynamic state,
    dynamic postalCode,
    dynamic country,
    bool? newUser,
    String? brandName,
  }) = _ConfirmPaasswordData;
}

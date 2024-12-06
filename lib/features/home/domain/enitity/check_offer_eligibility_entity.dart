import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_offer_eligibility_entity.freezed.dart';

@freezed
class CheckOfferEligibilityEntity with _$CheckOfferEligibilityEntity {
  const factory CheckOfferEligibilityEntity({
    int? responseCode,
    String? message,
    dynamic data,
  }) = _CheckOfferEligibilityEntity;
}

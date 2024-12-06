import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:messagecentral/features/home/domain/enitity/check_offer_update_eligibility_entity.dart';

part 'check_offer_update_eligibility_state.freezed.dart';

@unfreezed
class CheckOfferUpdateEligibilityState with _$CheckOfferUpdateEligibilityState {
  factory CheckOfferUpdateEligibilityState.initial() = _Initial;
  factory CheckOfferUpdateEligibilityState.loading() = _Loading;
  factory CheckOfferUpdateEligibilityState.success(CheckOfferUpdateEligibilityEntity checkOfferUpdateEligibilityEntity) = _Success;
  factory CheckOfferUpdateEligibilityState.error(String errorMessage) = _Error;
}
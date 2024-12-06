import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messagecentral/features/home/domain/enitity/check_offer_eligibility_entity.dart';

part 'check_offer_eligibility_state.freezed.dart';

@unfreezed
class CheckOfferEligibilityState with _$CheckOfferEligibilityState {
  factory CheckOfferEligibilityState.initial() = _Initial;
  factory CheckOfferEligibilityState.loading() = _Loading;
  factory CheckOfferEligibilityState.success(CheckOfferEligibilityEntity checkOfferEligibilityEntity) = _Success;
  factory CheckOfferEligibilityState.error(String errorMessage) = _Error;
}
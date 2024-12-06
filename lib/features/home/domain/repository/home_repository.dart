import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/home/domain/enitity/check_offer_eligibility_entity.dart';
import 'package:messagecentral/features/home/domain/enitity/check_offer_update_eligibility_entity.dart';

abstract class HomeRepository {
  Future<DataState<CheckOfferEligibilityEntity>> getOfferEligibility(
      {required String authToken, required String offerId});
  Future<DataState<CheckOfferUpdateEligibilityEntity>> updateOfferEligibility({
    required String authToken,
  });
}

import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/home/domain/enitity/check_offer_eligibility_entity.dart';
import 'package:messagecentral/features/home/domain/enitity/check_offer_update_eligibility_entity.dart';
import 'package:messagecentral/features/home/domain/repository/home_repository.dart';

import '../../../../core/usecase/usecase.dart';

class GetCheckOfferUpdateUsecase
    implements UseCase<DataState<CheckOfferUpdateEligibilityEntity>, void> {
  final HomeRepository homeRepository;
  GetCheckOfferUpdateUsecase(this.homeRepository);

  @override
  Future<DataState<CheckOfferUpdateEligibilityEntity>> call({void pramas}) {
    return homeRepository.updateOfferEligibility(
        authToken: LocalStateCache().authToken);
  }
}

class GetCheckOfferEligibilityUsecase
    implements UseCase<DataState<CheckOfferEligibilityEntity>, String> {
  final HomeRepository homeRepository;
  GetCheckOfferEligibilityUsecase(this.homeRepository);

  @override
  Future<DataState<CheckOfferEligibilityEntity>> call({String? pramas}) {
    return homeRepository.getOfferEligibility(
        authToken: LocalStateCache().authToken, offerId: pramas!);
  }
}

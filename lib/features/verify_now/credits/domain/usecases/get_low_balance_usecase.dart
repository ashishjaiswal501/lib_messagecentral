import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';

import 'package:messagecentral/features/verify_now/credits/domain/entity/low_balance_entity.dart';
import 'package:messagecentral/features/verify_now/credits/domain/repository/credits_repository.dart';


class GetLowBalanceUsecase
    implements UseCase<DataState<LowBalanceEntity>, void> {
  final CreditsRepository lowBalanceRepository;
  GetLowBalanceUsecase(this.lowBalanceRepository);

  @override
  Future<DataState<LowBalanceEntity>> call({void pramas}) {
    return lowBalanceRepository.fetchLowBalance();
  }
}

import 'package:messagecentral/features/wallet_balance/domain/enitity/wallet_balance_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class WalletBalanceRepository {
   Future<DataState<WalletBalanceEntity>> walletCreditsBalance({required String authToken,required String customerId});

}

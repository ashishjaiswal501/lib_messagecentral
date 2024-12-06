
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/wallet_balance/domain/enitity/wallet_balance_entity.dart';
import 'package:messagecentral/features/wallet_balance/domain/repository/wallet_balance_repository.dart';
part 'wallet_balance_usecase.g.dart';

class WalletBalanceUsecase
    implements
        UseCase<DataState<WalletBalanceEntity>,
            WalletBalancePrams> {
  final WalletBalanceRepository walletBalanceRepository;
  WalletBalanceUsecase({required this.walletBalanceRepository});

  @override
  Future<DataState<WalletBalanceEntity>> call(
      {WalletBalancePrams? pramas}) {
    return walletBalanceRepository.walletCreditsBalance(
        customerId: pramas!.customerId,
        authToken: pramas.authToken,
        
        );
  }
}

@JsonSerializable()
class WalletBalancePrams {
  String customerId;
  String authToken;

  WalletBalancePrams(
      { this.customerId = '',this.authToken=''});

  factory WalletBalancePrams.fromJson(Map<String, dynamic> json) =>
      _$WalletBalancePramsFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() =>
      _$WalletBalancePramsToJson(this);
}

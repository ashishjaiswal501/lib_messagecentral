import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/wallet_balance/domain/enitity/wallet_balance_entity.dart';

class WalletBalanceState extends Equatable {
  final WalletBalanceEntity? walletBalanceEntity;
  final String? dioError;
  const WalletBalanceState({this.walletBalanceEntity, this.dioError});
  @override
  List<Object?> get props => [walletBalanceEntity];
}

class WalletBalanceStateInitial extends WalletBalanceState {
  const WalletBalanceStateInitial();
}

class WalletBalanceStateLoading extends WalletBalanceState {
  const WalletBalanceStateLoading();
}

class WalletBalanceStateError extends WalletBalanceState {
  const WalletBalanceStateError( String dioError):super(dioError: dioError);
}

class WalletBalanceStateSuccess extends WalletBalanceState {
  const WalletBalanceStateSuccess(
    WalletBalanceEntity walletBalanceEntity,
  ) : super(walletBalanceEntity: walletBalanceEntity);
}

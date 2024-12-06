import 'package:equatable/equatable.dart';

class WalletBalanceEvent extends Equatable {
  const WalletBalanceEvent();
  @override
  
  List<Object?> get props => [];
}

class WalletBalanceCall extends WalletBalanceEvent {
  final String authToken;
  final String customerId;
  const WalletBalanceCall({this.authToken = "", this.customerId = ""});
}

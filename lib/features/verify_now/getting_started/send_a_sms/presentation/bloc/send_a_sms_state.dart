import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/entity/send_a_sms_enity.dart';

abstract class SendASmsState extends Equatable {
  final SendASmsEntity? sendASmsEntity;
  

  final String? dioError;
  final bool isSendASmsSuccess;

  const SendASmsState({
    this.sendASmsEntity,
    this.dioError,
    this.isSendASmsSuccess = false,
  });

  @override
  List<Object?> get props => [sendASmsEntity, dioError];
}

class SendASmsStateInitial extends SendASmsState {
  const SendASmsStateInitial()
      : super(
          isSendASmsSuccess: false,
        );
}

class BacktoPreviousStateInitial extends SendASmsState {
  const BacktoPreviousStateInitial()
      : super(
          isSendASmsSuccess: false,
        );
}

class SendASmsStateLoading extends SendASmsState {
  const SendASmsStateLoading()
      : super(
          isSendASmsSuccess: false,
        );
}

class SendASmsStateSuccess extends SendASmsState {
  const SendASmsStateSuccess(SendASmsEntity sendASmsEntity)
      : super(
          sendASmsEntity: sendASmsEntity,
          isSendASmsSuccess: true,
        );
}

class SendASmsStateError extends SendASmsState {
  const SendASmsStateError(String dioError)
      : super(
          dioError: dioError,
          isSendASmsSuccess: true,
        );
}



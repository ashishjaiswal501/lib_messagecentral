import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/usecases/send_a_sms_usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/send_a_sms_event.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/send_a_sms_state.dart';

class SendASmsBloc extends Bloc<SendASmsEvent, SendASmsState> {
  final SendASmsUsecase sendASmsUsecase;

  SendASmsBloc({
    required this.sendASmsUsecase,
  }) : super(const SendASmsStateInitial()) {
    on<GetSendASmsPressedButton>(_onSendASms);
  }

  void _onSendASms(
      GetSendASmsPressedButton event, Emitter<SendASmsState> emit) async {
    try {
      emit(const SendASmsStateLoading());
      final dataState = await sendASmsUsecase(
        pramas: SendASmsPrams(
            customerId: event.customerId!,
            mobileNumber: event.mobileNumber!,
            countryCode: event.countryCode!,
            flowType: event.flowType!,
            type: event.type!,
            senderId: event.senderId!,
            message: event.message!,
            authToken: event.authToken!),
      );
      if (dataState is DataSuccess && dataState.data != null) {
        emit(SendASmsStateSuccess(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(SendASmsStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const SendASmsStateInitial());
    }
  }
}

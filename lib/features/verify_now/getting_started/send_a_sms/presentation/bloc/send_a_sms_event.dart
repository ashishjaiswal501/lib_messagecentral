import 'package:equatable/equatable.dart';

abstract class SendASmsEvent extends Equatable {
  const SendASmsEvent();

  @override
  List<Object> get props => [];
}

class GetSendASmsPressedButton extends SendASmsEvent {
  final String? customerId;
  final String? mobileNumber;
  final String? countryCode;
  final String? flowType;
  final String? type;
  final String? senderId;
  final String? message;
  final String? authToken;

  const GetSendASmsPressedButton(
      {required this.customerId,
      required this.mobileNumber,
      required this.countryCode,
      required this.flowType,
      required this.type,
      required this.senderId,
      required this.message,
      required this.authToken});
}

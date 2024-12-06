

import 'package:equatable/equatable.dart';

abstract class VerifyBrandNameEvent extends Equatable {
  const VerifyBrandNameEvent();

  @override
  List<Object> get props => [];
}

class GetVerifyAUserUpdateBrandNamePressedButton extends VerifyBrandNameEvent {
   
  final String? brandName;
   final String? customerId;
  final String? authToken;

  const GetVerifyAUserUpdateBrandNamePressedButton({required this.brandName, required this.customerId,required this.authToken});
}
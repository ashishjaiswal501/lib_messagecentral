import 'package:equatable/equatable.dart';

class AccountDetailsEvent extends Equatable {
  const AccountDetailsEvent();
  @override
  List<Object?> get props => [];
}

class GetAccountDetailsUpdatePressed extends AccountDetailsEvent {
 final String? auth;
 final String? fname;
 final String? address;
final  String? city;
 final String? state;
 final String? postalCode;
 final String? country;
 final String? customerId;
 final String? lName;
final  String? email;
const  GetAccountDetailsUpdatePressed({this.auth='', this.address='', this.fname='', this.city='', this.country='', this.customerId='', this.email='', this.lName='', this.postalCode='', this.state='',});
}

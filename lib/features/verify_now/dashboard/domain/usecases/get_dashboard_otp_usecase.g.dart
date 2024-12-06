// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_dashboard_otp_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardOtpPrams _$DashboardOtpPramsFromJson(Map<String, dynamic> json) =>
    DashboardOtpPrams(
      customerId: json['customerId'] as String? ?? '',
      fromDate: json['fromDate'] as String? ?? '',
      toDate: json['toDate'] as String? ?? '',
      authToken: json['authToken'] as String? ?? '',
    );

Map<String, dynamic> _$DashboardOtpPramsToJson(DashboardOtpPrams instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'authToken': instance.authToken,
    };

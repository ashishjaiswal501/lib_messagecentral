import 'dart:io';

import 'package:dio/dio.dart';

import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';
import 'package:messagecentral/features/verify_now/dashboard/data/data_sources/remote/dashboard_api_service.dart';
import 'package:messagecentral/features/verify_now/dashboard/data/dto/dashboard_otp_dto.dart';
import 'package:messagecentral/features/verify_now/dashboard/data/dto/dashboard_sms_dto.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/entity/dashboard_otp_entity.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/entity/dashboard_sms_entity.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/repository/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardApiService dashboardApiService;
  DashboardRepositoryImpl({required this.dashboardApiService});
 @override
  Future<DataState<DashboardOtpEntity>> dashboardOtpEntity(
      {required String customerId,
      required String fromDate,
      required String toDate,
      required String authToken}) async {
    try {
      final httpResponse = await dashboardApiService.analyticsVerifyNowCallOtpApi(customerId,fromDate,toDate, authToken);
      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
        return DataSuccess(httpResponse.data.toEntity);
      }
      return DataFailed(httpResponse.response.statusMessage!);
    } on DioException catch (e) {
      final errorMessage = MyDioException.fromDioError(e).toString();
     
      return DataFailed(errorMessage);
    } catch (e) {
      
      return DataFailed(e.toString());
    }
  }

 @override
  Future<DataState<DashboardSmsEntity>> dashboardSmsEntity(
      {required String customerId,
      required String fromDate,
      required String toDate, 
      required String authToken}) async {
    try {
      final httpResponse = await dashboardApiService.analyticsVerifyNowCallSmsApi(customerId,fromDate,toDate,authToken);
      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
        return DataSuccess(httpResponse.data.toEntitySms);
      }
      return DataFailed(httpResponse.response.statusMessage!);
    } on DioException catch (e) {
      final errorMessage = MyDioException.fromDioError(e).toString();
      
      return DataFailed(errorMessage);
    } catch (e) {
      
      return DataFailed(e.toString());
    }
  }

 
}

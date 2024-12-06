import 'dart:io';

import 'package:dio/dio.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';
import 'package:messagecentral/features/verify_now/analytics/data/data_sources/remote/analytics_api_service.dart';
import 'package:messagecentral/features/verify_now/analytics/data/dto/analytics_dto.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/analytics_entity.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/repository/analytics_repository.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final AnalyticsApiService analyticsApiService;
  AnalyticsRepositoryImpl(this.analyticsApiService);
  
  @override
  Future<DataState<AnalyticsEntity>> analytics(
      {String? customerId,
      String? fromDate,
      String? toDate,
      String? authToken,
      String? type}) async{
         try {
      final httpResponse = await analyticsApiService.analytics(
        authToken!,
        customerId!,
        type!,
        fromDate!,
        toDate!,
        
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
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
}

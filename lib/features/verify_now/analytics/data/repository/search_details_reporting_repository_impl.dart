import 'dart:io';

import 'package:dio/dio.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';
import 'package:messagecentral/features/verify_now/analytics/data/data_sources/remote/search_details_reporting_api_service.dart';

import 'package:messagecentral/features/verify_now/analytics/data/dto/search_details_reporting_dto.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/search_details_reporting_entity.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/repository/search_details_reporting_repository.dart';

class SearchDetailsReportingRepositoryImpl
    implements SearchDetailsReportingRepository {
  final SearchDetailsReportingApiService searchDetailsReportingApiService;
  SearchDetailsReportingRepositoryImpl(this.searchDetailsReportingApiService);

  @override
  Future<DataState<DetailsReportingSearchEntity>> searchDetailedReporting({
    String? authToken,
    String? customerId,
    String? query,
    String? pageNo,
    String? size,
    String? type}) async {
    try {
      final httpResponse = await searchDetailsReportingApiService.searchDetailedReporting(
        authToken!,
        customerId!,
        query!,
        pageNo!,
        size!,
        type!,
       
    
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

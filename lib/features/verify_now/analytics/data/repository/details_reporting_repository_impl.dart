import 'dart:io';

import 'package:dio/dio.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';
import 'package:messagecentral/features/verify_now/analytics/data/data_sources/remote/details_reporting_api_serivce.dart';
import 'package:messagecentral/features/verify_now/analytics/data/dto/details_reporting_dto.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/details_reporting_entity.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/repository/details_reporting_repository.dart';

class DetailsReportingRepositoryImpl implements DetailsReportingRepository {
  final DetailsReportingApiService detailsReportingApiService;
  DetailsReportingRepositoryImpl(this.detailsReportingApiService);

  @override
  Future<DataState<DetailsReportingEntity>> detailsReporting(
      {String? customerId,
      String? from,
      String? pageNo,
      String? size,
      String? to,
      String? authToken,
      String? type}) async {
    try {
      final httpResponse = await detailsReportingApiService.detailsReporting(
        authToken!,
        customerId!,
        from!,
        pageNo!,
        size!,
        to!,
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

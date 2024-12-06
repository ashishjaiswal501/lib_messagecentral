import 'dart:io';

import 'package:dio/dio.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/verify_now/credits/data/data_sources/remote/credits_api_service.dart';
import 'package:messagecentral/features/verify_now/credits/data/dto/low_balance_dto.dart';
import 'package:messagecentral/features/verify_now/credits/data/dto/payment_history_dto.dart';
import 'package:messagecentral/features/verify_now/credits/domain/entity/low_balance_entity.dart';
import 'package:messagecentral/features/verify_now/credits/domain/entity/payment_history_entity.dart';
import 'package:messagecentral/features/verify_now/credits/domain/repository/credits_repository.dart';
import 'package:messagecentral/features/verify_now/credits/domain/usecases/get_low_balance_alert_save_usecase.dart';

class CreditsRepositoryImpl implements CreditsRepository {
  final CreditsApiService creditsApiService;
  CreditsRepositoryImpl(this.creditsApiService);
  @override
  Future<DataState<PaymentHistoryEntity>> paymentHistory(
      {String? customerId,
      String? fromDate,
      String? toDate,
      String? authToken}) async {
    try {
      final httpResponse = await creditsApiService.paymentHistory(
        authToken!,
        customerId!,
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

  @override
  Future<DataState<LowBalanceEntity>> fetchLowBalance(
      {String? customerId, String? authToken}) async {
    try {
      final httpResponse = await creditsApiService.getlowBalance(
          LocalStateCache().authToken, LocalStateCache().customerId);
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

  @override
  Future<DataState<LowBalanceEntity>> saveLowBalanceAlertDetail(
      {LowBalanceAlertRequest? lowBalanceAlertRequest,
      String? authToken}) async {
    try {
      final httpResponse = await creditsApiService.saveLowBalanceAlert(
          LocalStateCache().authToken, lowBalanceAlertRequest);
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

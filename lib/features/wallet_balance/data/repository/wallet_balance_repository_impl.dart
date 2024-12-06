import 'dart:io';

import 'package:dio/dio.dart';

import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';
import 'package:messagecentral/features/wallet_balance/data/data_sources/remote/wallet_balance_api_service.dart';
import 'package:messagecentral/features/wallet_balance/data/dto/wallet_balance_dto.dart';
import 'package:messagecentral/features/wallet_balance/domain/enitity/wallet_balance_entity.dart';
import 'package:messagecentral/features/wallet_balance/domain/repository/wallet_balance_repository.dart';

class WalletBalanceRepositoryImpl implements WalletBalanceRepository {
  final WalletBalanceApiService walletBalanceApiService;
  WalletBalanceRepositoryImpl(this.walletBalanceApiService);
  @override
  Future<DataState<WalletBalanceEntity>> walletCreditsBalance(
      {required String authToken, required String customerId}) async {
    try {
      final httpResponse = await walletBalanceApiService.walletCreditsBalance(
          authToken, customerId);
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
}

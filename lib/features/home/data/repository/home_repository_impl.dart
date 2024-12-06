import 'dart:io';

import 'package:dio/dio.dart';

import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';
import 'package:messagecentral/features/home/data/data_sources/remote/home_api_service.dart';
import 'package:messagecentral/features/home/data/dto/check_offer_eligibility_dto.dart';
import 'package:messagecentral/features/home/data/dto/check_offer_update_eligibility_dto.dart';
import 'package:messagecentral/features/home/domain/enitity/check_offer_eligibility_entity.dart';
import 'package:messagecentral/features/home/domain/enitity/check_offer_update_eligibility_entity.dart';
import 'package:messagecentral/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApiService homeApiService;
  HomeRepositoryImpl(this.homeApiService);
  @override
  Future<DataState<CheckOfferEligibilityEntity>> getOfferEligibility(
      {required String authToken, required String offerId}) async {
    try {
      final httpResponse =
          await homeApiService.getcheckOfferEligibility(authToken, offerId);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.toEnity);
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
  Future<DataState<CheckOfferUpdateEligibilityEntity>> updateOfferEligibility(
      {required String authToken}) async {
    try {
      final httpResponse =
          await homeApiService.updatecheckOfferEligibility(authToken);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.toEnity);
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

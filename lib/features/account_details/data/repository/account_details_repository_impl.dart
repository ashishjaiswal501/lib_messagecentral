import 'dart:io';

import 'package:dio/dio.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/account_details/data/data_sources/remote/user_account_detail_api_service.dart';

import 'package:messagecentral/features/account_details/data/dto/update_phone_number_dto.dart';
import 'package:messagecentral/features/account_details/domain/enitity/update_phone_number_entity.dart';
import 'package:messagecentral/features/account_details/domain/repository/account_details_repository.dart';
import 'package:messagecentral/features/account_details/domain/usecases/get_account_details_usecase.dart';
import 'package:messagecentral/features/find_by_customer_id/data/dto/find_by_customer_id_dto.dart';
import 'package:messagecentral/features/find_by_customer_id/domain/entity/find_by_customer_id_entity.dart';

class AccountDetailsRepositoryImpl implements AccountDetailsRepository {
  final UserAccountDetailsApiService accountDetailsAPiService;
  AccountDetailsRepositoryImpl(this.accountDetailsAPiService);
  @override
  Future<DataState<FindByCustomerIdEntity>> updateAccountDetails(
      {AccountDetailsRequest? accountDetailsRequest}) async {
    try {
      final httpResponse = await accountDetailsAPiService.updateAccountDetails(
          LocalStateCache().authToken, accountDetailsRequest!);

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
  Future<DataState<FindByCustomerIdEntity>> updatePassword(
      {String newPassword = '',
      String oldPassword = '',
      String customerId = '',
      String authToken = ''}) async {
    try {
      final httpResponse = await accountDetailsAPiService.updatePassword(
          LocalStateCache().authToken,
          LocalStateCache().customerId,
          newPassword,
          oldPassword);

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
  Future<DataState<UpdatePhoneNumberEntity>> updatePhoneNumber(
      {String phoneNumber = '',
      String countryCode = '',
      String authToken = '',
      String customerId = '',
      String otp = '',
      String verificationId = ''}) async {
    try {
      final httpResponse = await accountDetailsAPiService.updatePhoneNo(
          LocalStateCache().authToken,
          countryCode,
          phoneNumber,
          LocalStateCache().customerId,
          verificationId,
          otp);

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
  Future<DataState<UpdatePhoneNumberEntity>> updatePhoneNumberGetOtp(
      {String phoneNumber = '',
      String countryCode = '',
      String authToken = ''}) async {
    try {
      final httpResponse = await accountDetailsAPiService.updatePhoneGetOtp(
        LocalStateCache().authToken,
        countryCode,
        phoneNumber,
      );

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

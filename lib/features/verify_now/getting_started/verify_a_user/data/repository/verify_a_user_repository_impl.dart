import 'dart:io';

import 'package:dio/dio.dart';

import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/data/data_sources/remote/verify_a_user_api_service.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/data/dto/verify_a_user_dto.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/data/dto/verify_a_user_otp_verification_dto.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_enity.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_otp_verification_entity.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_update_brand_name_entity.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/repository/verify_a_user_repository.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/data/dto/verify_a_user_update_brand_name_dto.dart';

class VerifyAUserRepositoryImpl extends VerifyAUserRepository {
  final VerifyAUserApiService verifyAUserApiService;
  VerifyAUserRepositoryImpl({required this.verifyAUserApiService});
  @override
  Future<DataState<VerifyAUserEntity>> verifyAUserApi(
      {required String flowType,
      required String customerId,
      required String countryCode,
      required String mobileNumber,
      required String authToken}) async {
    try {
      final httpResponse = await verifyAUserApiService.verifyAUserApi(
          flowType, customerId, countryCode, mobileNumber, authToken);
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
  Future<DataState<VerifyAUserOtpVerificationEntity>>
      verifyAUserOtpVerificationApi({
    required String code,
    required String customerId,
    required String verificationId,
    required String authToken,
  }) async {
    try {
      final httpResponse =
          await verifyAUserApiService.verifyAUserOtpVerificationApi(
              code, customerId, verificationId, authToken);
      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
        return DataSuccess(httpResponse.data.toEntity);
      }
      if (httpResponse.response.statusCode == HttpStatus.internalServerError) {
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
  Future<DataState<VerifyAUserUpdateBrandNameEntity>>
      verifyAUserUpdateBrandNameApi({
    required String brandName,
    required String customerId,
    required String authToken,
  }) async {
    try {
      final httpResponse = await verifyAUserApiService
          .verifyAUserUpdateBrandNameApi(brandName, customerId, authToken);
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

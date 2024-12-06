import 'dart:io';

import 'package:dio/dio.dart';

import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';
import 'package:messagecentral/features/signup/data/data_sources/remote/signup_api_service.dart';
import 'package:messagecentral/features/signup/data/dto/resend_otp_dto.dart';
import 'package:messagecentral/features/signup/data/dto/signup_dto.dart';
import 'package:messagecentral/features/signup/data/dto/signup_otp_dto.dart';
import 'package:messagecentral/features/signup/data/dto/signup_verify_otp_dto.dart';
import 'package:messagecentral/features/signup/domain/entity/resend_otp_enity.dart';
import 'package:messagecentral/features/signup/domain/entity/signup_enity.dart';
import 'package:messagecentral/features/signup/domain/entity/signup_otp_enity.dart';
import 'package:messagecentral/features/signup/domain/entity/signup_verify_otp_enity.dart';
import 'package:messagecentral/features/signup/domain/repository/signup_repository.dart';
import 'package:messagecentral/features/signup/domain/usecases/get_signup_usecase.dart';

class SignupRepositoryImpl extends SignupRepository {
  final SignupAPiService signupAPiService;
  SignupRepositoryImpl({required this.signupAPiService});
  @override
  Future<DataState<SignupEntity>> signup(
      {required SignupRequestPrams signupRequestPrams}) async {
    try {
      final httpResponse = await signupAPiService.signup(signupRequestPrams);
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
  Future<DataState<SignupOtpEntity>> signUpOtp(
      {required String customId,
      required String phoneNumber,
      required String countryCode,
      required String authToken,
      }) async {
    try {
      Map<String, dynamic> requestBody = {
        "countryCode": countryCode,
        "customerId": customId,
        "phoneNo": phoneNumber
      };
      final httpResponse =
          await signupAPiService.signUpOtp(requestBody, authToken);
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
  Future<DataState<SignupVerifyOtpEntity>> validateOtp({required String customerId, required String otpVerificationId, required String otp, required String authToken}) async {
     try {
      Map<String, dynamic> requestBody = {
        "customerId": customerId,
        "otpVerificationId": otpVerificationId,
        "otp": otp
      };
      final httpResponse =
          await signupAPiService.validateOtp(requestBody, authToken);
      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
        return DataSuccess(httpResponse.data.signupVerifyToEntity);
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
  Future<DataState<ResendOtpEntity>> resendOtp(
      {required String email,
      required String phoneCode,
      required String phoneNo}) async {
    try {
      final httpResponse = await signupAPiService.resendOtp(email,phoneCode,phoneNo);
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

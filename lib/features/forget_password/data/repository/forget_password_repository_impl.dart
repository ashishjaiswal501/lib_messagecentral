import 'dart:io';

import 'package:dio/dio.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';
import 'package:messagecentral/features/forget_password/data/data_sources/remote/forget_password_api_service.dart';
import 'package:messagecentral/features/forget_password/data/dto/confirm_password_dto.dart';
import 'package:messagecentral/features/forget_password/data/dto/forget_password_Otp_dto.dart';
import 'package:messagecentral/features/forget_password/data/dto/forget_password_email_dto.dart';
import 'package:messagecentral/features/forget_password/domain/entity/confirm_password_entity.dart';
import 'package:messagecentral/features/forget_password/domain/entity/forget_password_email_entity.dart';
import 'package:messagecentral/features/forget_password/domain/entity/forget_password_otp_entity.dart';
import 'package:messagecentral/features/forget_password/domain/repository/forget_password_repository.dart';

class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  final ForgetPasswordApiService forgetPasswordApiService;
  ForgetPasswordRepositoryImpl({required this.forgetPasswordApiService});
  @override
  Future<DataState<ForgetPasswordEmailEntity>> forgetPasswordWithEmail(
      {required String email}) async {
    try {
      final httpResponse =
          await forgetPasswordApiService.forgotPasswordwithEmail(email.trim());
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
  Future<DataState<ForgetPasswordOtpEntity>> forgetPasswordWithOtp(
      {required String email,
      required String code,
      required String verificationId}) async {
    try {
      final httpResponse = await forgetPasswordApiService.forgotPasswordwithOtp(
          email, code, verificationId);
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
  Future<DataState<ConfirmPasswordEntity>> forgetConfirmPaasword({required String email, required String newPassword, required String authToken}) async{
    try {
      final httpResponse = await forgetPasswordApiService
          .forgotpasswordConfirm(email,newPassword, authToken);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.toEntity);
      }
       return DataFailed(httpResponse.response.statusMessage!);
    } on DioException catch(e){
       final errorMessage = MyDioException.fromDioError(e).toString();

      return DataFailed(errorMessage);
    }
    
     catch (e) {
       return DataFailed(e.toString());
    }
  }

 
}

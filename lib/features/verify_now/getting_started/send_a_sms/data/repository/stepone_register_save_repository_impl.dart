import 'dart:io';

import 'package:dio/dio.dart';

import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';

import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/data/data_sources/remote/stepone_register_save_api_service.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/data/dto/stepone_register_save_dto.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/entity/stepone_register_save_entity.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/repository/stepone_register_save_repository.dart';

class SteponeRegisterSaveRepositoryImpl extends SteponeRegisterSaveRepository {
  final SteponeRegisterSaveAPiService steponeRegisterSaveAPiService;
  SteponeRegisterSaveRepositoryImpl(
      {required this.steponeRegisterSaveAPiService});

  @override
  Future<DataState<SteponeRegisterSaveEntity>> steponeRegisterSaveApi(
      {required String name,
      required String companyName,
      required String companyWebsite,
      required String workingEmail,
      required String contactNumber,
      required String countryToSendSMS,
      required bool hasIndianRegisteredID,
      required String usageDescription,
      required String userAccountType,
      required String userAddress,
      required String userCountry,
      required String userCity,
      required String userState,
      required String userZipCode,
      required bool resellerType,
      required String authToken}) async {
    try {
      Map<String, dynamic> requestBody = {
        "name": name,
        "companyName": companyName,
        "companyWebsite": companyWebsite,
        "workingEmail": workingEmail,
        "contactNumber": contactNumber,
        "countryToSendSMS": countryToSendSMS,
        "hasIndianRegisteredID": hasIndianRegisteredID,
        "usageDescription": usageDescription,
        "userAccountType": userAccountType,
        "userAddress": userAddress,
        "userCountry": userCountry,
        "userCity": userCity,
        "userState": userState,
        "userZipCode": userZipCode,
        "resellerType": resellerType
      };

      final httpResponse = await steponeRegisterSaveAPiService
          .steponeRegisterSaveApi(requestBody, authToken);
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
  Future<DataState<SteponeRegisterSaveEntity>> steponeRegisterGetDemo(
      {required String customerId, required String authToken}) async {
    try {
      final httpResponse = await steponeRegisterSaveAPiService
          .steponeRegisterGetdemo(customerId, authToken);
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

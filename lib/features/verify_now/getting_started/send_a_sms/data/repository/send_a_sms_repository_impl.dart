import 'dart:io';

import 'package:dio/dio.dart';

import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/data/data_sources/remote/send_a_sms_api_service.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/data/dto/send_a_sms_dto.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/entity/send_a_sms_enity.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/repository/send_a_sms_repository.dart';

      
class SendASmsRepositoryImpl extends SendASmsRepository {
  final SendASmsAPiService sendASmsApiService;
  SendASmsRepositoryImpl({required this.sendASmsApiService});
  @override
  Future<DataState<SendASmsEntity>> sendASmsApi(
      {required String customerId,required String mobileNumber,required String countryCode,required String flowType,required String type,required String senderId,required String message,required String authToken}) async {
    try {
      final httpResponse = await sendASmsApiService.sendASmsApi(customerId,mobileNumber,countryCode,flowType,type,senderId,message,authToken);
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




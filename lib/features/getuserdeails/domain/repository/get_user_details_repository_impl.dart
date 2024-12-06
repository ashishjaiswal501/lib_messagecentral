import 'dart:io';

import 'package:dio/dio.dart';

import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';
import 'package:messagecentral/features/getuserdeails/data/data_sources/remote/get_user_deails_api_service.dart';
import 'package:messagecentral/features/getuserdeails/data/dto/get_user_details_dto.dart';
import 'package:messagecentral/features/getuserdeails/data/repository/get_user_details_repository.dart';
import 'package:messagecentral/features/getuserdeails/domain/enitity/get_user_details_entity.dart';

class GetUserDetailsRepositoryImpl implements GetUserDetailsRepository {
  final GetUserDetailsAPiService getUserDetailsAPiService;
  GetUserDetailsRepositoryImpl(this.getUserDetailsAPiService);
  @override
  Future<DataState<GetUserDetailsEntity>> getUserDetails(
      {required String authToken}) async {
   
     try {
       final httpResponse =
        await getUserDetailsAPiService.getUserDetails(authToken);
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

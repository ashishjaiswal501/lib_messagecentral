import 'dart:io';

import 'package:dio/dio.dart';

import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';
import 'package:messagecentral/features/find_by_customer_id/data/data_source/remote/find_by_customer_id_api_service.dart';
import 'package:messagecentral/features/find_by_customer_id/data/dto/find_by_customer_id_dto.dart';
import 'package:messagecentral/features/find_by_customer_id/domain/entity/find_by_customer_id_entity.dart';
import 'package:messagecentral/features/find_by_customer_id/domain/repository/find_by_customer_id_repository.dart';

class FindByCustomerIdRepositoryImpl implements FindByCustomerIdRepository {
  final FindByCustomerIdAPiService findByCustomerIdAPiService;
  FindByCustomerIdRepositoryImpl(this.findByCustomerIdAPiService);
  @override
  Future<DataState<FindByCustomerIdEntity>> findByCustomerId(
      {required String authToken,required String customerId}) async {
   
     try {
       final httpResponse =
        await findByCustomerIdAPiService.findByCustomerId(authToken,customerId);
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

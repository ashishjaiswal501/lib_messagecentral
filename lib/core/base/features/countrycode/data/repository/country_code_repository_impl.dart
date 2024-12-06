import 'dart:io';

import 'package:dio/dio.dart';
import 'package:messagecentral/core/base/features/countrycode/data/data_resources/remote/country_code_api_service.dart';
import 'package:messagecentral/core/base/features/countrycode/data/dto/country_code_dto.dart';
import 'package:messagecentral/core/base/features/countrycode/domain/entity/country_code_entity.dart';
import 'package:messagecentral/core/base/features/countrycode/domain/repository/country_code_repository.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';

class CountryCodeRepositoryImpl  extends CountryCodeRepository{
  final CountryCodeApiService countryCodeApiService;
  CountryCodeRepositoryImpl({required this.countryCodeApiService});
  @override
  Future<DataState<CountryCodeEntity>> getCountryCode() async{
   try {
      final httpResponse =
          await countryCodeApiService.fetchCountryCode();
      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
        return DataSuccess(httpResponse.data.formtoEntity);
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
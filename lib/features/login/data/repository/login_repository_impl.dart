import 'dart:io';

import 'package:dio/dio.dart';

import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/resources/dio_exception.dart';
import 'package:messagecentral/features/login/data/data_sources/remote/login_api_service.dart';
import 'package:messagecentral/features/login/data/dto/login_dto.dart';
import 'package:messagecentral/features/login/domain/entity/login_enity.dart';
import 'package:messagecentral/features/login/domain/repository/login_repository.dart';
import 'package:messagecentral/features/login/domain/usecases/get_login_usecase.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginAPiService loginAPiService;
  LoginRepositoryImpl({required this.loginAPiService});
  @override
  Future<DataState<LoginEntity>> login(
      {required LoginRequestPrams loginRequestPrams}) async {
    try {
      final httpResponse = await loginAPiService.login(loginRequestPrams);
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

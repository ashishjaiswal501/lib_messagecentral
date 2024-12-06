import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/login/data/dto/login_dto.dart';

import 'package:retrofit/retrofit.dart';

import 'package:messagecentral/features/login/domain/usecases/get_login_usecase.dart';
part 'login_api_service.g.dart';

@RestApi()
abstract class LoginAPiService {
  factory LoginAPiService(
    Dio dio, {String baseUrl=''}
  ) => _LoginAPiService(dio, baseUrl:FlavorConfig.instance!.values!.baseUrl!);

  @Header("Content-Type: application/json")  
  @POST(ApiEndPoints.login)
  Future<HttpResponse<LoginDto>> login(
      @Body() LoginRequestPrams loginRequestPramas);
}

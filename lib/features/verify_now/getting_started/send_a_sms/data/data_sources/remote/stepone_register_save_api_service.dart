import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/data/dto/stepone_register_save_dto.dart';
import 'package:retrofit/retrofit.dart';
part 'stepone_register_save_api_service.g.dart';

@RestApi()
abstract class SteponeRegisterSaveAPiService {
  factory SteponeRegisterSaveAPiService(Dio dio, {String baseUrl = ''}) =>
      _SteponeRegisterSaveAPiService(dio,
          baseUrl: FlavorConfig.instance!.values!.baseUrl!);

  @Header(
    "Content-Type: application/json",
  )
  @POST(ApiEndPoints.steponeRegisterSaveAPi)
  Future<HttpResponse<SteponeRegisterSaveDto>> steponeRegisterSaveApi(
      @Body() Map<String, dynamic> map, @Header("authToken") String authToken);

  @Header(
    "Content-Type: application/json",
  )
  @GET('${ApiEndPoints.steponeRegisterGetdemo}/{id}')
  Future<HttpResponse<SteponeRegisterSaveDto>> steponeRegisterGetdemo(
      @Path("id") String customerId, @Header("authToken") String authToken);
}

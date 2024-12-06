import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/getuserdeails/data/dto/get_user_details_dto.dart';

import 'package:retrofit/retrofit.dart';
part 'get_user_deails_api_service.g.dart';

@RestApi()
abstract class GetUserDetailsAPiService {
  factory GetUserDetailsAPiService(Dio dio, {String baseUrl = ''}) =>
      _GetUserDetailsAPiService(dio,
          baseUrl: FlavorConfig.instance!.values!.baseUrl!);

  @Header("Content-Type: application/json")
  @GET(ApiEndPoints.getUserDetails)
  Future<HttpResponse<GetUserDetailsDto>> getUserDetails(
      @Header("authToken") String authToken);
}

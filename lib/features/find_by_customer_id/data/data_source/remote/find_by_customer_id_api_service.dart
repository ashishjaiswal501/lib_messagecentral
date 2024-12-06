import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/find_by_customer_id/data/dto/find_by_customer_id_dto.dart';

import 'package:retrofit/retrofit.dart';
part 'find_by_customer_id_api_service.g.dart';

@RestApi()
abstract class FindByCustomerIdAPiService {
  factory FindByCustomerIdAPiService(Dio dio, {String baseUrl = ''}) =>
      _FindByCustomerIdAPiService(dio,
          baseUrl: FlavorConfig.instance!.values!.baseUrl!);

  @Header("Content-Type: application/json")
  @GET('${ApiEndPoints.findByCustomerId}/{customerId}')
  Future<HttpResponse<FindByCustomerIdDto>> findByCustomerId(
      @Header("authToken") String authToken, @Path("customerId") String customerId);
}

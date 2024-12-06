import 'package:dio/dio.dart';
import 'package:messagecentral/core/base/features/countrycode/data/dto/country_code_dto.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:retrofit/retrofit.dart';
part 'country_code_api_service.g.dart';
@RestApi()
abstract class CountryCodeApiService {
  factory CountryCodeApiService(Dio dio, {String baseUrl = ''}) =>
      _CountryCodeApiService(dio,
          baseUrl: FlavorConfig.instance!.values!.baseUrl!);

  @Header("Content-Type: application/json")
  @GET(ApiEndPoints.countryCode)
  Future<HttpResponse<CountryCodeDto>> fetchCountryCode();
}

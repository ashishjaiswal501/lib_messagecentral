import 'package:dio/dio.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/data/dto/send_a_sms_dto.dart';
import 'package:retrofit/retrofit.dart';
part 'send_a_sms_api_service.g.dart';

@RestApi()
abstract class SendASmsAPiService {
  factory SendASmsAPiService(Dio dio, {String baseUrl = ''}) =>
      _SendASmsAPiService(dio,
          baseUrl: FlavorConfig.instance!.values!.baseUrl!);

  @Header(
    "Content-Type: application/json",
  )
  @POST(ApiEndPoints.sendASmsApi)
  @MultiPart()
  Future<HttpResponse<SendASmsDto>> sendASmsApi(
      @Part(name: 'customerId') String customerId,
      @Part(name: 'mobileNumber') String mobileNumber,
      @Part(name: 'countryCode') String countryCode,
      @Part(name: 'flowType') String flowType,
      @Part(name: 'type') String type,
      @Part(name: 'senderId') String senderId,
      @Part(name: 'message') String message,
      @Header("authToken") String authToken);
}

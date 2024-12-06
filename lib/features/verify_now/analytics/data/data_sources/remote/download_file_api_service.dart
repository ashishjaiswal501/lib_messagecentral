import 'package:http/http.dart' as http;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';

Future<void> downloadFile(String authToken, String customerId, String from,
    String to, String type) async {
  String fileUrl =
      "${FlavorConfig.instance!.values!.baseUrl!}${ApiEndPoints.downloadDetailReporting}?from=$from&to=$to&customerId=$customerId&type=$type";

  http.Response response = await http.get(
    Uri.parse(fileUrl),
    headers: {
      'authToken': authToken,
    },
  );

  if (response.statusCode == 200) {
    String apiUrl = fileUrl;

    html.AnchorElement anchorElement = html.AnchorElement(href: apiUrl);
    anchorElement.download = apiUrl;
    anchorElement.click();
  } else {}
}

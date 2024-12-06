// ignore_for_file: must_be_immutable, unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';

class JavaCodeWidget extends StatelessWidget {
  String sendOtpRequest =
      "OkHttpClient client = new OkHttpClient()\n.newBuilder()\n.build();\n\nMediaType mediaType = MediaType.parse(\"text/plain\");\nRequestBody body = RequestBody.create(mediaType, \"\");\nRequest request = new Request.Builder()\n.url(\"${FlavorConfig.instance!.values!.baseUrl}verification/v3/send?countryCode=${LocalStateCache().countryCode}&customerId=${LocalStateCache().customerId}&flowType=WHATSAPP&mobileNumber=${LocalStateCache().phoneNo}\")\n.method(\"POST\", body)\n.addHeader(\"authToken\", \"***********\")\n.build();\n\nResponse response = client.newCall(request).execute();";

  String sendOtpRequestCopy =
      "OkHttpClient client = new OkHttpClient()\n.newBuilder()\n.build();\n\nMediaType mediaType = MediaType.parse(\"text/plain\");\nRequestBody body = RequestBody.create(mediaType, \"\");\nRequest request = new Request.Builder()\n.url(\"${FlavorConfig.instance!.values!.baseUrl}verification/v3/send?countryCode=${LocalStateCache().countryCode}&customerId=${LocalStateCache().customerId}&flowType=WHATSAPP&mobileNumber=${LocalStateCache().phoneNo}\")\n.method(\"POST\", body)\n.addHeader(\"authToken\", ${LocalStateCache().authToken})\n.build();\n\nResponse response = client.newCall(request).execute();";

  // String validateOtpRequest =
  //     '${FlavorConfig.instance!.values!.baseUrl}verification/v3/validateOtp?countryCode=${LocalStateCache().countryCode}&mobileNumber=${LocalStateCache().phoneNo}&verificationId=XX&customerId=${LocalStateCache().customerId}&code=XXXX\' \\ --header \'authToken: ***********';

  String validateOtpRequestCopy =
      '''OkHttpClient client = new OkHttpClient().newBuilder()
  .build();
MediaType mediaType = MediaType.parse("text/plain");
RequestBody body = RequestBody.create(mediaType, "");
Request request = new Request.Builder()
  .url("${FlavorConfig.instance!.values!.baseUrl}verification/v3/validateOtp?countryCode=${LocalStateCache().countryCode}&mobileNumber=${LocalStateCache().phoneNo}&verificationId=XX&customerId=${LocalStateCache().customerId}&code=XXXX")
  .method("GET", body)
  .addHeader("authToken", "${LocalStateCache().authToken}")
  .build();
Response response = client.newCall(request).execute();''';

  String validateOtpRequest =
      '''OkHttpClient client = new OkHttpClient().newBuilder()
  .build();
MediaType mediaType = MediaType.parse("text/plain");
RequestBody body = RequestBody.create(mediaType, "");
Request request = new Request.Builder()
  .url("${FlavorConfig.instance!.values!.baseUrl}verification/v3/validateOtp?countryCode=${LocalStateCache().countryCode}&mobileNumber=${LocalStateCache().phoneNo}&verificationId=XX&customerId=${LocalStateCache().customerId}&code=XXXX")
  .method("GET", body)
  .addHeader("authToken", "***********")
  .build();
Response response = client.newCall(request).execute();''';
  JavaCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Send OTP',
                style: GoogleFonts.getFont(
                  'Plus Jakarta Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Curl -X POST',
                  style: GoogleFonts.getFont(
                    'Plus Jakarta Sans',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 14.0,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: const Color(0xFFDFE2E6),
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        10.0, 10.0, 10.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            sendOtpRequest,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .copyWith(fontSize: 14.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Clipboard.setData(
                                  ClipboardData(text: sendOtpRequestCopy));
                            },
                            child: const Icon(
                              Icons.content_copy,
                              color: Color(0xFF7A8699),
                              size: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Sample Successful response for Send OTP',
                  style: GoogleFonts.getFont(
                    'Plus Jakarta Sans',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: const Color(0xFFDFE2E6),
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        10.0, 10.0, 10.0, 10.0),
                    child: Text(
                      '{\n\"responseCode\": 200,\n\"message\": \"SUCCESS\",\n\"data\": {\n\"verificationId\": \"20\",\n\"mobileNumber\": \"8846735392\",\n\"responseCode\": \"200\",\n\"errorMessage\": null,\n\"timeout\": \"60\",\n\"smsCLI\": null,\n\"transactionId\": null\n}\n}',
                      style: GoogleFonts.getFont(
                        'Plus Jakarta Sans',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Validate OTP',
                style: GoogleFonts.getFont(
                  'Plus Jakarta Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Curl -X GET',
                  style: GoogleFonts.getFont(
                    'Plus Jakarta Sans',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 14.0,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: const Color(0xFFDFE2E6),
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        10.0, 10.0, 10.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            validateOtpRequest,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .copyWith(fontSize: 14.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Clipboard.setData(
                                  ClipboardData(text: validateOtpRequestCopy));
                            },
                            child: const Icon(
                              Icons.content_copy,
                              color: Color(0xFF7A8699),
                              size: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Sample Successful response for Validate OTP',
                  style: GoogleFonts.getFont(
                    'Plus Jakarta Sans',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: const Color(0xFFDFE2E6),
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        10.0, 10.0, 10.0, 10.0),
                    child: Text(
                      '{\n\"responseCode\": 200,\n\"message\": \"SUCCESS\",\n\"data\": {\n\"verificationId\": 20,\n\"mobileNumber\": \"8846735392\",\n\"verificationStatus\": \"VERIFICATION_COMPLETED\",\n\"responseCode\": \"200\",\n\"errorMessage\": null,\n\"transactionId\": null,\n\"authToken\": null\n}\n}',
                      style: GoogleFonts.getFont(
                        'Plus Jakarta Sans',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

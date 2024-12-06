// ignore_for_file: must_be_immutable, unnecessary_string_escapes

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/core/utils/extention_util.dart';

import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';

class CurlCodeWidget extends StatelessWidget {
  String sendOtpRequest =
      "curl --location --request POST \'${FlavorConfig.instance!.values!.baseUrl}verification/v3/send?countryCode=${LocalStateCache().countryCode}&customerId=${LocalStateCache().customerId}&flowType=WHATSAPP&mobileNumber=${LocalStateCache().phoneNo}\' \\ --header \'authToken: ***********'";
  String sendOtpRequestCopy =
      '''curl --location --request POST '${FlavorConfig.instance!.values!.baseUrl}verification/v3/send?countryCode=${LocalStateCache().countryCode}&customerId=${LocalStateCache().customerId}&flowType=WHATSAPP&mobileNumber=${LocalStateCache().phoneNo}' \
  --header 'authToken: ${LocalStateCache().authToken}' ''';
  // String sendOtpRequestCopy2 =
  //     "curl --location --request POST \'${FlavorConfig.instance!.values!.baseUrl}verification/v2/verification/send?countryCode=${LocalStateCache().countryCode}&customerId=${LocalStateCache().customerId}&flowType=WHATSAPP&mobileNumber=${LocalStateCache().phoneNo}\' \\ --header \'authToken: ${LocalStateCache().authToken}'";

  String validateOtpRequest =
      "curl --location --request GET \'${FlavorConfig.instance!.values!.baseUrl}verification/v3/validateOtp?countryCode=${LocalStateCache().countryCode}&mobileNumber=${LocalStateCache().phoneNo}&verificationId=XX&customerId=${LocalStateCache().customerId}&code=XXXX\' \\ --header \'authToken: ***********'";
  String validateOtpRequestCopy =
      '''curl --location --request GET '${FlavorConfig.instance!.values!.baseUrl}verification/v3/validateOtp?countryCode=${LocalStateCache().countryCode}&mobileNumber=${LocalStateCache().phoneNo}&verificationId=XX&customerId=${LocalStateCache().customerId}&code=XXXX' \
--header 'authToken: eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJDLUZBNTY5QzEzODY0QjQ5OSIsImlhdCI6MTcyMDY3NzcwOSwiZXhwIjoxODc4MzU3NzA5fQ.IKzKR57hg8vdCQux-GnGbuxw1H9BMXxrrJOS_OwUl2TZ2XxDZpDof9wcvenw6yG2Ygjcpfr8dEMVizPZaWf-KA' ''';

  CurlCodeWidget({super.key});

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
              const SizedBox(
                height: 16,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: const Color(0xFFCAF2FF),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_rounded,
                      color: Color(0xFF0F8AB0),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text.rich(
                        TextSpan(
                            text:
                                'The Curl employs the Auth Token for testing purposes only. Please utilize the "Generate token API" outlined in the comprehensive ',
                            children: <InlineSpan>[
                              TextSpan(
                                  text: 'API Document ',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      await launchApiDocUrl();
                                      MixPanelAnalyticsManager().sendEvent(
                                          'verify_now_try_with_code_api_doc',
                                          'verify now try with code api doc',
                                          null);
                                    },
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blue60,
                                    decorationColor: AppColors.blue60,
                                  )),
                              const TextSpan(
                                  text: 'to create a fresh token.',
                                  style: TextStyle(
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF067699))),
                            ]),
                        style: const TextStyle(
                            color: Color(0xFF067699),
                            fontSize: 14,
                            // decoration:
                            //     TextDecoration
                            //         .underline,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              ScreenUtil().setVerticalSpacing(16),
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

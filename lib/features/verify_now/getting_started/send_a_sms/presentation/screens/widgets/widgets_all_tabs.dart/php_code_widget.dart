// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/utils/app_environment.dart';

import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';

// ignore: must_be_immutable
class PhpCodeWidget extends StatelessWidget {
  String sendOtpRequest =
            "<?php\nrequire_once 'HTTP/Request2.php';\n\$request = new HTTP_Request2();\n\$request->setUrl('${FlavorConfig.instance!.values!.baseUrl}verification/v3/send?countryCode=${LocalStateCache().countryCode}&customerId=${LocalStateCache().customerId}&senderId=UTOMOB&type=SMS&flowType=SMS&mobileNumber=${LocalStateCache().phoneNo}&message=Welcome to Message Central. We are delighted to have you here! - Powered by U2opia');\n\$request->setMethod(HTTP_Request2::METHOD_POST);\n\$request->setConfig(array(\n'follow_redirects' => TRUE\n));\n\$request->setHeader(array(\n'authToken' => '***********'\n));\ntry {\n\$response = \$request->send();\nif (\$response->getStatus() == 200) {\necho \$response->getBody();\n}\nelse {\necho 'Unexpected HTTP status: ' . \$response->getStatus() . ' ' .\n\$response->getReasonPhrase();\n}\n}\ncatch(HTTP_Request2_Exception \$e) {\necho 'Error: ' . \$e->getMessage();\n}";

  String sendOtpRequestCopy =
            "<?php\nrequire_once 'HTTP/Request2.php';\n\$request = new HTTP_Request2();\n\$request->setUrl('${FlavorConfig.instance!.values!.baseUrl}verification/v3/send?countryCode=${LocalStateCache().countryCode}&customerId=${LocalStateCache().customerId}&senderId=UTOMOB&type=SMS&flowType=SMS&mobileNumber=${LocalStateCache().phoneNo}&message=Welcome to Message Central. We are delighted to have you here! - Powered by U2opia');\n\$request->setMethod(HTTP_Request2::METHOD_POST);\n\$request->setConfig(array(\n'follow_redirects' => TRUE\n));\n\$request->setHeader(array(\n'authToken' => ${LocalStateCache().authToken}\n));\ntry {\n\$response = \$request->send();\nif (\$response->getStatus() == 200) {\necho \$response->getBody();\n}\nelse {\necho 'Unexpected HTTP status: ' . \$response->getStatus() . ' ' .\n\$response->getReasonPhrase();\n}\n}\ncatch(HTTP_Request2_Exception \$e) {\necho 'Error: ' . \$e->getMessage();\n}";

  PhpCodeWidget({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Send SMS',
                style: GoogleFonts.getFont(
                  'Plus Jakarta Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                      color: const Color(0xFF42526D),
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
                      color: const Color(0xFF42526D),
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
        ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:lottie/lottie.dart';
import 'package:messagecentral/core/utils/extention_util.dart';
import 'package:messagecentral/core/utils/firebase_analytics_functions.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';

class DeveloperDocsScreen extends StatelessWidget {
  const DeveloperDocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MixPanelAnalyticsManager().sendEvent('Docs_landing', 'Docs landing', null);
    setScreenFirebase("Docs_landing", "Docs landing");
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
              child: Container(
                width: 400.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: const Color(0xFFDFE2E6),
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 24.0, 24.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Text(
                          'Developer Docs',
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 21.0,
                          ),
                        ),
                      ),
                      Lottie.asset(
                        'assets/lottie_animations/illustration_Coding-coding.json',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                        animate: true,
                      ),
                      const Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          'Click the below button to view Verify Now comprehensive API Documentation',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      ScreenUtil().setVerticalSpacing(16),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              minimumSize: const Size(double.infinity, 48)),
                          onPressed: () async {
                            await launchApiDocUrl();
                            MixPanelAnalyticsManager().sendEvent(
                                'Developer_API_doc', 'Developer API doc', null);
                          },
                          child: const Text("Verify Now API Documentation"))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:messagecentral/core/constants/image_path.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messagecentral/core/constants/app_colors.dart';

class SignupSideScreen extends StatelessWidget {
  const SignupSideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.00, 0.00),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(90.0, 45.0, 90.0, 45.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Text('Get started now and try our service for free',
                    style: TextStyle(
                        color: AppColors.whiteTextColor, fontSize: 27)),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: ListTile(
                  leading: Icon(
                    Icons.check_circle,
                      color: AppColors.rightTickColor,
                    size: 24.0,
                  ),
                  title: Text(
                    'Cost effective solution',
                    style: TextStyle(
                        color: AppColors.whiteTextColor, fontSize: 17),
                  ),
                  subtitle: Text(
                      'Supercheap. Pay only successful messages. No hidden fees or subscription charges. No credit card required',
                      style: TextStyle(
                          color: AppColors.whiteTextColor, fontSize: 14)),
                  dense: false,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: ListTile(
                  leading: Icon(
                    Icons.check_circle,
                     color: AppColors.rightTickColor,
                    size: 24.0,
                  ),
                  title: Text('Dashboard analytics',
                      style: TextStyle(
                          color: AppColors.whiteTextColor, fontSize: 17)),
                  subtitle: Text(
                      'Monitor, analyze, gain valuable insights into messaging usage and user activities',
                      style: TextStyle(
                          color: AppColors.whiteTextColor, fontSize: 14)),
                  dense: false,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: AppColors.rightTickColor,
                    size: 24.0,
                  ),
                  title: Text('Set it and forget it',
                      style: TextStyle(
                          color: AppColors.whiteTextColor, fontSize: 17)),
                  subtitle: Text(
                      'Hassle-free operation without the need for ongoing maintenance or monitoring.',
                      style: TextStyle(
                          color: AppColors.whiteTextColor, fontSize: 14)),
                  dense: false,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: Text(
                  'Trusted by',
                  style: TextStyle(
                          color: AppColors.whiteTextColor, fontSize: 11),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Wrap(
                  spacing: 40.0,
                  runSpacing: 25.0,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: SvgPicture.asset(
                        ImagePath
                            .partnerlogo1, // Replace with the path to your SVG file
                        width: 70.0,
                        height: 24.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: SvgPicture.asset(
                        ImagePath
                            .partnerlogo2, // Replace with the path to your SVG file
                        width: 70.0,
                        height: 24.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: SvgPicture.asset(
                        ImagePath
                            .partnerlogo3, // Replace with the path to your SVG file
                        width: 70.0,
                        height: 24.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

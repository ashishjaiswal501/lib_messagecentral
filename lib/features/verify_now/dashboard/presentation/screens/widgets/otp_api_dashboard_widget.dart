// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class OtpApiDashboardWidget extends StatefulWidget {
  final dynamic dashboardDataOtp;

  const OtpApiDashboardWidget({super.key, this.dashboardDataOtp});

  @override
  _OtpApiDashboardWidgetState createState() => _OtpApiDashboardWidgetState();
}

class _OtpApiDashboardWidgetState extends State<OtpApiDashboardWidget> {
  int crossAxisCount = 3; // Default value

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1630) {
          crossAxisCount = 3;
        } else if (constraints.maxWidth >= 700) {
          crossAxisCount = 3;
        } else {
          crossAxisCount = 1;
        }

        return GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 3.0,
          ),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 6, // Adjust the count based on your actual data
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return buildGridItem(
                  title: 'OTP Requested',
                  value: (widget.dashboardDataOtp?.sent ?? 0).toString(),
                  color: const Color(0xFF215196),
                );
              case 1:
                return buildGridItem(
                  title: 'OTP Verified',
                  value: (widget.dashboardDataOtp?.verified ?? 0).toString(),
                  color: const Color(0xFF0E7E3E),
                );
              case 2:
                return buildGridItem(
                  title: 'Verified Rate',
                  value:
                      "${widget.dashboardDataOtp?.verifiedPercentage?.toStringAsFixed(1) ?? 0}%",
                  color: const Color(0xFF20A4CD),
                );
              case 3:
                return buildGridItem(
                  title: 'OTP Delivered',
                  value: (widget.dashboardDataOtp?.delivered ?? 0).toString(),
                  color: const Color(0xFF6215DD),
                );
              case 4:
                return buildGridItem(
                  title: 'OTP Failed to deliver',
                  value: (widget.dashboardDataOtp?.failed ?? 0).toString(),
                  color: const Color(0xFFE03227),
                );
              case 5:
                return buildGridItem(
                  title: 'Cost',
                  value:
                      '\$${widget.dashboardDataOtp?.totalCost.toStringAsFixed(3) ?? "0.000"}',
                  color: const Color(0xFF243757),
                );
              default:
                return Container(); // Return an empty container for any additional indices
            }
          },
        );
      },
    );
  }

  Widget buildGridItem({
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.0),
        border: Border.all(
          color: const Color(0xFFDFE2E6),
        ),
      ),
      child: Align(
        alignment: const AlignmentDirectional(-1.00, 0.00),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 10.0, 12.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(-1.00, 1.00),
                  child: Text(
                    value,
                    maxLines: 1,
                    style: TextStyle(
                      color: color,
                      fontSize: 35.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

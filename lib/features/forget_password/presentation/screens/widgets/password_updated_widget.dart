import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:messagecentral/config/routes/route.dart';

class PasswordUpdatedWidget extends StatelessWidget {
  const PasswordUpdatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: ListTile(
            minLeadingWidth: 0,
            dense: true,
            contentPadding: const EdgeInsets.only(left: 6.0, right: 5.0),
            leading: const Icon(
              Icons.check_circle,
              color: Color(0xFF11984A),
              size: 20.0,
            ),
            title: const Align(
              alignment: Alignment(-1.06, 0),
              child: Text(
                'Password is updated successfully..',
                style: TextStyle(
                  color: Color(0xFF084B25),
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
              ),
            ),
            tileColor: const Color.fromARGB(255, 229, 240, 234),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
        ScreenUtil().setVerticalSpacing(16),
        ElevatedButton(
            style: OutlinedButton.styleFrom(
              elevation: 0.1,
              minimumSize: const Size(double.infinity, 52),
            ),
            onPressed: () {
              context.goNamed(RoutePath.login.name);
            },
            child: const Text("Back to log in")),
      ],
    );
  }
}

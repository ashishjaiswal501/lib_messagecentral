import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messagecentral/core/constants/image_path.dart';

class BrandLogoTtitle extends StatelessWidget {
  const BrandLogoTtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          ImagePath.brandlogo,
          width: 251.0,
          height: 64.0.h,
          fit: BoxFit.contain,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 2.0),
          child: Text('Create your account',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 21,
                  color: const Color(0xFF091E42))),
        ),
      ],
    );
  }
}

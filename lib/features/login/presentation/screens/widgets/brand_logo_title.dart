import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:messagecentral/config/routes/route.dart';
import 'package:messagecentral/core/constants/image_path.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';

class BrandLogoTtitle extends StatelessWidget {
  final String? title;

  const BrandLogoTtitle({
    super.key,
    this.title,
  });

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
          child: Text(title ?? 'Log in',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 21,
                  color: const Color(0xFF091E42))),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: 'Don’t have an account yet? ',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: const Color(0xff243757),
                      fontSize: 14.0,
                      letterSpacing: 0)),
              TextSpan(
                text: 'Create an account',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14.0,
                    letterSpacing: 0),
                mouseCursor: SystemMouseCursors.click,
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    context.goNamed(
                      RoutePath.signup.name,
                    );

                    LocalStateCache().setisInitialStepSignup = false;
                    MixPanelAnalyticsManager().sendEvent(
                        'login_signup', 'Login to Signup redirection', null);
                  },
              )
            ],
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

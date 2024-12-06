import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:messagecentral/config/routes/route.dart';
import 'package:messagecentral/core/global_widgets/global_widgets.dart';
import 'package:messagecentral/core/utils/validator.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_otp_state.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class OtpVerifyWidget extends StatefulWidget {
  const OtpVerifyWidget(
      {super.key,
      required this.onPressed,
      required this.otpController,
      required this.onFieldSubmitted,
      required this.otpTimerChild,
      this.state});

  final VoidCallback? onPressed;
  final TextEditingController otpController;
  final void Function(String)? onFieldSubmitted;
  final dynamic state;

  final Widget otpTimerChild;

  @override
  State<OtpVerifyWidget> createState() => _OtpVerifyWidgetState();
}

class _OtpVerifyWidgetState extends State<OtpVerifyWidget> with Validator {
  bool enableResendOtp = false;
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  // StopWatchTimer timerController =
  //     StopWatchTimer(mode: StopWatchMode.countDown);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Enter OTP that we've just seen to your registered mobile number",
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: const Color(0xFF243757), fontSize: 14.0),
        ),
        ScreenUtil().setVerticalSpacing(8),
        TextFormField(
            controller: widget.otpController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
            ],
            obscureText: false,
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Color(0xFF243757), fontSize: 14),
            keyboardType: TextInputType.number,
            onFieldSubmitted: widget.onFieldSubmitted,
            validator: validateOTP),
        ScreenUtil().setVerticalSpacing(4),
        widget.otpTimerChild,
        ScreenUtil().setVerticalSpacing(16),
        ElevatedButton(
            style: OutlinedButton.styleFrom(
              elevation: 0.1,
              minimumSize: const Size(double.infinity, 52),
            ),
            onPressed: widget.state == const ForgetPasswordOtpStateLoading()
                ? null
                : () {
                    widget.onPressed?.call();
                  },
            child: Visibility(
                visible: widget.state != const ForgetPasswordOtpStateLoading(),
                replacement: GlobalWidgets.loadingWidget(),
                child: const Text("Submit OTP"))),
        ScreenUtil().setVerticalSpacing(16),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              side: const BorderSide(color: Color(0xFF2861B4)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
              elevation: 0.1,
              minimumSize: const Size(double.infinity, 52),
            ),
            onPressed: () {
              context.goNamed(RoutePath.login.name);
            },
            child: const Text("Go back to log in"))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:messagecentral/config/routes/route.dart';
import 'package:messagecentral/core/global_widgets/global_widgets.dart';
import 'package:messagecentral/core/utils/validator.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_state.dart';

class EmailVerifyWidget extends StatefulWidget {
  const EmailVerifyWidget(
      {super.key,
      required this.onPressed,
      required this.emailController,
      required this.onFieldSubmitted,
      this.state = const ForgetPasswordStateInitial()});
  final TextEditingController emailController;
  final VoidCallback? onPressed;
  final Function(String)? onFieldSubmitted;
  final ForgetPasswordState state;
  @override
  State<EmailVerifyWidget> createState() => _EmailVerifyWidgetState();
}

class _EmailVerifyWidgetState extends State<EmailVerifyWidget> with Validator {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Enter an email id that associated with your account',
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: const Color(0xFF243757), fontSize: 14.0),
        ),
        ScreenUtil().setVerticalSpacing(8),
        TextFormField(
            controller: widget.emailController,
            obscureText: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Color(0xFF243757), fontSize: 14),
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: widget.onFieldSubmitted,
            validator: validateEmail),
        ScreenUtil().setVerticalSpacing(16),
        ElevatedButton(
            style: OutlinedButton.styleFrom(
              elevation: 0.1,
              minimumSize: const Size(double.infinity, 52),
            ),
            onPressed: widget.onPressed,
            child: Visibility(
                visible: widget.state != const ForgetPasswordStateLoading(),
                replacement: GlobalWidgets.loadingWidget(),
                child: const Text("Confirm"))),
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

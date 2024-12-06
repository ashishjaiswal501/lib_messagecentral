import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:messagecentral/config/routes/route.dart';
import 'package:messagecentral/core/global_widgets/global_widgets.dart';
import 'package:messagecentral/core/utils/validator.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_state.dart';

class ConfrimPasswordWidget extends StatefulWidget {
  const ConfrimPasswordWidget(
      {super.key,
      required this.formKey,
      required this.onTap,
      required this.confirmPasswordController,
      required this.onFieldSubmitted,
      this.state});
  final GlobalKey<FormState> formKey;
  final VoidCallback onTap;
  final TextEditingController confirmPasswordController;
  final void Function(String)? onFieldSubmitted;
  final dynamic state;
  @override
  State<ConfrimPasswordWidget> createState() => _ConfrimPasswordWidgetState();
}

class _ConfrimPasswordWidgetState extends State<ConfrimPasswordWidget>
    with Validator {
  final TextEditingController _newPasswordController = TextEditingController();
  final FocusNode _confirmPasswordControllerFocus = FocusNode();

  final FocusNode _newpasswordControllerFocus = FocusNode();

  bool iSobscureTextNewPassword = true;
  bool iSobscureTextConfirmPassword = true;

  void obscureTextNewPassword() {
    setState(() {
      iSobscureTextNewPassword = !iSobscureTextNewPassword;
    });
  }

  void obscureTextConfirmPassword() {
    setState(() {
      iSobscureTextConfirmPassword = !iSobscureTextConfirmPassword;
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.confirmPasswordController.clear();
    _newPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
              controller: _newPasswordController,
              obscureText: iSobscureTextNewPassword,
              focusNode: _newpasswordControllerFocus,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                  hintText: 'Enter New Password',
                  suffixIcon: IconButton(
                      splashRadius: 10,
                      onPressed: () {
                        obscureTextNewPassword();
                      },
                      icon: Icon(!iSobscureTextNewPassword
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined))),
              textInputAction: TextInputAction.next,
              style: const TextStyle(color: Color(0xFF243757), fontSize: 14),
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {
                _newPasswordController.text = value;
                FocusScope.of(context)
                    .requestFocus(_confirmPasswordControllerFocus);
              },
              validator: validatePassword),
          ScreenUtil().setVerticalSpacing(16),
          TextFormField(
            controller: widget.confirmPasswordController,
            obscureText: iSobscureTextConfirmPassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                hintText: 'Confirm New Password',
                suffixIcon: IconButton(
                    splashRadius: 10,
                    onPressed: () {
                      obscureTextConfirmPassword();
                    },
                    icon: Icon(!iSobscureTextConfirmPassword
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined))),
            focusNode: _confirmPasswordControllerFocus,
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Color(0xFF243757), fontSize: 14),
            keyboardType: TextInputType.emailAddress,
            validator: ((value) =>
                validateConfirmPassword(value, _newPasswordController.text)),
            onFieldSubmitted: (value) {
              widget.onFieldSubmitted!(value);
              widget.confirmPasswordController.text = value;

              FocusScope.of(context)
                  .requestFocus(_confirmPasswordControllerFocus);
            },
          ),
          ScreenUtil().setVerticalSpacing(16),
          ElevatedButton(
              style: OutlinedButton.styleFrom(
                elevation: 0.1,
                minimumSize: const Size(double.infinity, 52),
              ),
              onPressed: widget.state == const ForgetPasswordConfirmStateLoading()
                  ? null
                  : () {
                      if (widget.formKey.currentState!.validate()) {
                        widget.onTap.call();
                      }
                    },
              child: Visibility(
                  visible:
                      widget.state != const ForgetPasswordConfirmStateLoading(),
                  replacement: GlobalWidgets.loadingWidget(),
                  child: const Text("Confirm Changes"))),
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
      ),
    );
  }
}

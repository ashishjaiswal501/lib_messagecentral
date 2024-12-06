import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/global_widgets/custom_button.dart';
import 'package:messagecentral/core/utils/extention_util.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/core/utils/validator.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_password_bloc.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_password_event.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_password_state.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_bloc.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_event.dart';

class UpdatePasswordWidget extends StatefulWidget {
  const UpdatePasswordWidget({super.key});

  @override
  State<UpdatePasswordWidget> createState() => _UpdatePasswordWidgetState();
}

class _UpdatePasswordWidgetState extends State<UpdatePasswordWidget>
    with Validator {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final FocusNode _confirmPasswordControllerFocus = FocusNode();

  final FocusNode _newpasswordControllerFocus = FocusNode();
  final FocusNode _currentpasswordControllerFocus = FocusNode();
  bool iSobscureTextNewPassword = true;
  bool iSobscureTextConfirmPassword = true;
  final formKey = GlobalKey<FormState>();
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

    _newPasswordController.clear();
    _confirmPasswordController.clear();
    _newPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
                color: Colors.transparent,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width >= 800
                      ? (MediaQuery.sizeOf(context).width * 0.4)
                      : (MediaQuery.sizeOf(context).width * 0.95),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Update Password',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  // _model.otpStatus = 0;
                                });
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.close,
                                color: Color(0xFF42526D),
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: Color(0xFFDFE2E6),
                      ),
                      //if (_model.otpStatus == 0)

                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 5.0, 20.0, 20.0),
                        child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Current Password',
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                ),
                                ScreenUtil().setVerticalSpacing(4.0),
                                TextFormField(
                                    controller: _currentPasswordController,
                                    focusNode: _currentpasswordControllerFocus,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Current Password',
                                    ),
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(
                                        color: Color(0xFF243757), fontSize: 14),
                                    keyboardType: TextInputType.emailAddress,
                                    onFieldSubmitted: (value) {
                                      _newPasswordController.text = value;
                                      FocusScope.of(context).requestFocus(
                                          _newpasswordControllerFocus);
                                    },
                                    validator: validatePassword),
                                ScreenUtil().setVerticalSpacing(16),
                                const Text(
                                  'New Password',
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                ),
                                ScreenUtil().setVerticalSpacing(4),
                                TextFormField(
                                    controller: _newPasswordController,
                                    obscureText: iSobscureTextNewPassword,
                                    focusNode: _newpasswordControllerFocus,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                        hintText: 'Enter New Password',
                                        suffixIcon: IconButton(
                                            splashRadius: 10,
                                            onPressed: () {
                                              obscureTextNewPassword();
                                            },
                                            icon: Icon(!iSobscureTextNewPassword
                                                ? Icons.remove_red_eye_outlined
                                                : Icons
                                                    .visibility_off_outlined))),
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(
                                        color: Color(0xFF243757), fontSize: 14),
                                    keyboardType: TextInputType.emailAddress,
                                    onFieldSubmitted: (value) {
                                      _newPasswordController.text = value;
                                      FocusScope.of(context).requestFocus(
                                          _confirmPasswordControllerFocus);
                                    },
                                    validator: validatePassword),
                                ScreenUtil().setVerticalSpacing(16),
                                const Text(
                                  'Confirm New Password',
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                ),
                                ScreenUtil().setVerticalSpacing(4),
                                TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: iSobscureTextConfirmPassword,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                      hintText: 'Confirm New Password',
                                      suffixIcon: IconButton(
                                          splashRadius: 10,
                                          onPressed: () {
                                            obscureTextConfirmPassword();
                                          },
                                          icon: Icon(!iSobscureTextConfirmPassword
                                              ? Icons.remove_red_eye_outlined
                                              : Icons
                                                  .visibility_off_outlined))),
                                  focusNode: _confirmPasswordControllerFocus,
                                  textInputAction: TextInputAction.next,
                                  style: const TextStyle(
                                      color: Color(0xFF243757), fontSize: 14),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: ((value) =>
                                      validateConfirmPassword(
                                          value, _newPasswordController.text)),
                                  onFieldSubmitted: (value) {
                                    _confirmPasswordController.text = value;

                                    FocusScope.of(context).requestFocus(
                                        _confirmPasswordControllerFocus);
                                  },
                                ),
                              ],
                            )),
                      ),

                      Align(
                        alignment: const AlignmentDirectional(1.00, 0.00),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      MixPanelAnalyticsManager().sendEvent(
                                          'account_details_update_password_cancel',
                                          'Account details update password cancel',
                                          null);
                                      Navigator.pop(context);
                                    },
                                    text: 'Cancel',
                                    options: FFButtonOptions(
                                      hoverColor: Colors.grey[200],
                                      height: 44.0,
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12.0, 0.0, 12.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: const Color(0x00FFFFFF),
                                      textStyle: const TextStyle(
                                        color: Color(0xFF2861B4),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),
                                      elevation: 0.0,
                                      borderSide: const BorderSide(
                                        color: Color(0x00FFFFFF),
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                      hoverElevation: 0.0,
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: BlocListener<UpdatePasswordBloc,
                                      UpdatePasswordState>(
                                    listener: (context, state) {
                                      if (state is UpdatePasswordStateSuccess) {
                                        context
                                            .read<FindByCustomerIdBloc>()
                                            .add(const FindByCustomerIdCall());
                                        Navigator.of(context).pop();
                                        _confirmPasswordController.clear();
                                        _newPasswordController.clear();
                                        _currentPasswordController.clear();
                                      }

                                      if (state is UpdatePasswordStateError) {
                                        showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              alignment:
                                                  const Alignment(0.65, 0.0),
                                              content: Text(state.dioError!),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text("OK")),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState!.save();
                                          context
                                              .read<UpdatePasswordBloc>()
                                              .add(GetUpdatePasswordPressed(
                                                  oldPassword:
                                                      _currentPasswordController
                                                          .text
                                                          .base64Function(
                                                              _currentPasswordController
                                                                  .text),
                                                  newPassword:
                                                      _confirmPasswordController
                                                          .text
                                                          .base64Function(
                                                              _confirmPasswordController
                                                                  .text)));
                                        }
                                        MixPanelAnalyticsManager().sendEvent(
                                            'account_details_update_password_confirm',
                                            'Account details update password confirm',
                                            null);
                                      },
                                      text: 'Update',
                                      options: FFButtonOptions(
                                        height: 44.0,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12.0, 0.0, 12.0, 0.0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFF2861B4),
                                        textStyle: const TextStyle(
                                          color: AppColors.whiteTextColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0,
                                        ),
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        hoverElevation: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/utils/custom_icon.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/screens/widgets/widgets_all_tabs.dart/c_code_widget.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/screens/widgets/widgets_all_tabs.dart/curl_code_widget.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/screens/widgets/widgets_all_tabs.dart/java_code_widget.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/screens/widgets/widgets_all_tabs.dart/node_code_widget.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/screens/widgets/widgets_all_tabs.dart/php_code_widget.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/screens/widgets/widgets_all_tabs.dart/python_code_widget.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/screens/widgets/widgets_all_tabs.dart/ruby_code_widget.dart';

class TryWithCodeTabSendSMS extends StatefulWidget {
  const TryWithCodeTabSendSMS({super.key});

  @override
  State<TryWithCodeTabSendSMS> createState() => _TryWithCodeTabSendSMSState();
}

class _TryWithCodeTabSendSMSState extends State<TryWithCodeTabSendSMS>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool passwordVisibility = false;
  bool snippet = true;
  LocalStateCache localStateCache = LocalStateCache();

  TextEditingController customerIdController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setCustomerId();
    _tabController = TabController(length: 7, vsync: this);
  }

  void setCustomerId() {
    setState(() {
      customerIdController.text = localStateCache.customerId;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool iSobscureTextCustomerId = true;

  void obscureTextCustomerId() {
    setState(() {
      iSobscureTextCustomerId = !iSobscureTextCustomerId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: const Color(0xFF42526D),
                width: 1.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Customer ID',
                      style: GoogleFonts.getFont(
                        'Plus Jakarta Sans',
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      '[Please keep this code confidential]',
                      style: GoogleFonts.getFont(
                        'Plus Jakarta Sans',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 4.0, 0.0, 0.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Container(
                            width: 465.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F6F7),
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                color: const Color(0xFFB3B9C4),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      // Assuming LocalStateCache().customerId is a TextEditingController
                                      controller: customerIdController,
                                      readOnly: true,
                                      obscureText:
                                          !passwordVisibility, // Invert the password visibility
                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          color: const Color(0xFF98A1B0),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                        ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsetsDirectional
                                                .fromSTEB(
                                                12.0, 12.0, 12.0, 12.0),
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            setState(() {
                                              passwordVisibility =
                                                  !passwordVisibility; // Toggle visibility
                                            });
                                          },
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            !passwordVisibility
                                                ? Icons.visibility_off_outlined
                                                : Icons.visibility_outlined,
                                            color: const Color(0xFF7A8699),
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Plus Jakarta Sans',
                                        color: const Color(0xFF42526D),
                                        fontSize: 14.0,
                                      ),
                                      textAlign: TextAlign.start,
                                      // Add your validator if needed
                                      // validator: _model.textController4Validator.asValidator(context),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Clipboard.setData(ClipboardData(
                                          text: LocalStateCache().customerId));
                                    },
                                    child: const Icon(
                                      FFIcons.kcopy,
                                      color: Color(0xFF7A8699),
                                      size: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    if (snippet)
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: 465.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFCAF2FF),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.circleInfo,
                                  color: Color(0xFF0F8AB0),
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                    child: Text(
                                      'Use these pre-built snippets to try it out with code.',
                                      style: GoogleFonts.getFont(
                                        'Plus Jakarta Sans',
                                        color: const Color(0xFF067699),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 11.0,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    setState(() {
                                      snippet = false;
                                      // Toggle visibility
                                    });
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Color(0xFF42526D),
                                    size: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: const Color(0xFF42526D),
                  width: 1.0,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    child: TabBar(
                      controller: _tabController,
                      labelColor: const Color(0xFF243757),
                      unselectedLabelColor: const Color(0xFF4E596A),
                      labelStyle: GoogleFonts.getFont(
                        'Plus Jakarta Sans',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelStyle: GoogleFonts.getFont(
                        'Plus Jakarta Sans',
                        color: const Color(0xFF42526D),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                      isScrollable: true,
                      indicatorWeight: 3.0,
                      indicatorColor: const Color(0xFF1B4078),
                      tabs: const [
                        Tab(text: 'Curl'),
                        Tab(text: 'Java'),
                        Tab(text: 'Node'),
                        Tab(text: 'PHP'),
                        Tab(text: 'Python'),
                        Tab(text: 'Ruby'),
                        Tab(text: 'C#'),
                      ],
                      labelPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      indicatorPadding: const EdgeInsets.only(left: 10.0),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      border: Border.all(
                        color: const Color(0xFF42526D),
                        width: .5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height + 200,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        CurlCodeWidget(),
                        JavaCodeWidget(),
                        NodeCodeWidget(),
                        PhpCodeWidget(),
                        PythonCodeWidget(),
                        RubyCodeWidget(),
                        CCodeWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

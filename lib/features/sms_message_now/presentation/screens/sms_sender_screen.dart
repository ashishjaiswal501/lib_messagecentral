import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/global_widgets/custom_button.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/features/sms_message_now/presentation/screens/widgets/manage_template_widget.dart';

class SMSSenderScreen extends StatefulWidget {
  const SMSSenderScreen({super.key});

  @override
  State<SMSSenderScreen> createState() => _SMSSenderScreenState();
}

class _SMSSenderScreenState extends State<SMSSenderScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              height: 76.0,
              color: FlutterFlowTheme.of(context).primaryBackground,
              child: Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                          child: Text('SMS',
                              style: CustomTextStyle.getFont(
                                  FlutterFlowTheme.of(context).primaryText,
                                  17.0,
                                  FontWeight.w700)),
                        ),
                        const TabBar(
                          isScrollable: true,

                          //controller: _model.tabBarController,
                          unselectedLabelColor: Color(0xFF7A8699),
                          labelColor: Color(0xFF2861B4),
                          indicatorColor: Colors.transparent,
                          dividerColor: Colors.transparent,
                          tabs: [
                            Tab(
                                child: Row(
                              children: [
                                Icon(
                                  Icons.chat_outlined,
                                  size: 24.0,
                                ),
                                SizedBox(width: 10.0),
                                Text('SMS')
                              ],
                            )),
                            Tab(
                                child: Row(
                              children: [
                                Icon(
                                  Icons.send,
                                  size: 24.0,
                                ),
                                SizedBox(width: 10.0),
                                Text('Manage SenderID')
                              ],
                            )),
                            Tab(
                                child: Row(
                              children: [
                                Icon(
                                  Icons.event_note_outlined,
                                  size: 24.0,
                                ),
                                SizedBox(width: 10.0),
                                Text('Manage Templates')
                              ],
                            )),
                          ],
                        )
                      ])),
            ),
            Expanded(
              child: TabBarView(children: [
                const Center(
                  child: Text("Center"),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // buildNoSenderIdContainer(context),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 10),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                                onTap: () async {
                                  showAddSenderIdWidget(context, true, null);
                                },
                                child: const IgnorePointer(
                                    child: ButtonWidget(
                                        'Add New Sender ID', Icons.add))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            child: DataTable2(

                                // dataRowColor: Colors.black,
                                columnSpacing: 12,
                                horizontalMargin: 12,
                                // minWidth: MediaQuery.of(context).size.width,
                                //smRatio: 0.75,
                                // lmRatio: 1.5,
                                dataRowHeight: 46,
                                headingRowHeight: 46,
                                showBottomBorder: true,
                                isHorizontalScrollBarVisible: true,
                                isVerticalScrollBarVisible: true,
                                dataTextStyle: GoogleFonts.getFont(
                                  'Plus Jakarta Sans',
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                                headingRowDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: const Border(
                                      left:
                                          BorderSide(color: Color(0xFF091E42)),
                                      right:
                                          BorderSide(color: Color(0xFF091E42)),
                                    )),
                                border: TableBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  left: const BorderSide(
                                    color: Color(0xFFDFE2E6),
                                  ),
                                  right: const BorderSide(
                                    color: Color(0xFFDFE2E6),
                                  ),
                                ),
                                headingTextStyle: GoogleFonts.getFont(
                                  'Plus Jakarta Sans',
                                  color: AppColors.whiteTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                                headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => const Color(0xFF091E42)),
                                dividerThickness: 0.5,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                columns: const [
                                  DataColumn2(
                                      //size: ColumnSize.M,

                                      label: Text(
                                    'Sender Name',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  )),
                                  DataColumn2(
                                      //size: ColumnSize.M,

                                      label: Text(
                                    'Sender ID',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  )),
                                  DataColumn2(
                                      // size: ColumnSize.M,
                                      // fixedWidth: 120,
                                      label: Text(
                                    'Sender Type',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  )),
                                  DataColumn2(
                                      // size: ColumnSize.M,
                                      // fixedWidth: 120,
                                      label: Text(
                                    'Status',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  )),
                                  DataColumn2(
                                      // size: ColumnSize.M,
                                      // fixedWidth: 120,
                                      label: Text(
                                    'Create Date',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  )),
                                  DataColumn2(
                                      // size: ColumnSize.M,
                                      // fixedWidth: 120,
                                      label: Text(
                                    'Approved Date',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  )),
                                  DataColumn2(
                                      //size: ColumnSize.L,
                                      fixedWidth: 130,
                                      label: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Action',
                                          softWrap: true,
                                          textAlign: TextAlign.start,
                                        ),
                                      )),
                                ],
                                rows: [
                                  DataRow(cells: [
                                    const DataCell(Text("Tokopidia")),
                                    const DataCell(Text("234554889723")),
                                    const DataCell(Text("Promotional")),
                                    DataCell(Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 247, 237, 209),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        child: const Text(
                                          "Pending",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.orangeAccent),
                                        ))),
                                    const DataCell(Text("14/09/2023")),
                                    const DataCell(Text("-")),
                                    DataCell(Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Wrap(
                                            runSpacing: 15.0,
                                            spacing: 15.0,
                                            // alignment: alignment,
                                            children: [
                                              InkWell(
                                                  child: const Icon(
                                                      FontAwesomeIcons
                                                          .penToSquare,
                                                      color: Color(0xFF5D6B82),
                                                      size: 16.0),
                                                  onTap: () {
                                                    // showAddGroupWidget(context, false, item);
                                                  }),
                                              InkWell(
                                                  child: const Icon(
                                                      FontAwesomeIcons.trashCan,
                                                      color: Color(0xFF5D6B82),
                                                      size: 16.0),
                                                  onTap: () {
                                                    // showDeleteUI(item);
                                                  })
                                            ]),
                                      ],
                                    )),
                                  ]),
                                ]),
                          ),
                        ),
                     
                      ],
                    ),
                  ),
                ),
                const ManageTemplatesWidget()
              ]),
            )
          ],
        ),
      ),
    );
  }

  Container buildNoSenderIdContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          border: Border.all(color: const Color(0xFFDFE2E6)),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      child: SingleChildScrollView(
        child: Column(children: [
          SvgPicture.asset(
            'assets/images/cleanstate.svg',
            height: 304.0,
            width: 304.0,
          ),
          Text('Looks like you are starting with a clean slate',
              style: CustomTextStyle.getFont(
                  FlutterFlowTheme.of(context).primaryTextColor,
                  21.0,
                  FontWeight.w600)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Let’s start by creating a new sender ID',
                style: CustomTextStyle.getFont(
                    FlutterFlowTheme.of(context).primaryText,
                    21.0,
                    FontWeight.w400)),
          ),
          InkWell(
              onTap: () async {
                showAddSenderIdWidget(context, true, null);
              },
              child: const IgnorePointer(
                  child: ButtonWidget('Add New Sender ID', Icons.add))),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }

  void showAddSenderIdWidget(
      BuildContext context, bool isNewFlag, dynamic itemObj) async {
    await showDialog(
        context: context,
        builder: (context2) => Dialog(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              child: Container(
                constraints: BoxConstraints(
                    minHeight: 200,
                    maxWidth: MediaQuery.sizeOf(context).width * 0.4),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScreenUtil().setVerticalSpacing(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          isNewFlag ? "Add Sender ID" : "Edit",
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context2);
                          },
                          child: const Icon(
                            Icons.close,
                            color: Color(0xFF42526D),
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                    ScreenUtil().setVerticalSpacing(16),
                    const Divider(
                        color: Color.fromARGB(255, 211, 211, 212), height: 2.0),
                    ScreenUtil().setVerticalSpacing(16),
                    const Text(
                      "Sender Name",
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                    ScreenUtil().setVerticalSpacing(4),
                    TextFormField(
                      //controller: controller,
                      style: const TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 14.0,
                      ),
                      decoration: const InputDecoration(
                        isDense: true,
                      ),
                      onFieldSubmitted: (value) {
                        // controller.text = value;
                      },
                    ),
                    ScreenUtil().setVerticalSpacing(16),
                    const Text(
                      "Sender ID",
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                    ScreenUtil().setVerticalSpacing(4),
                    TextFormField(
                      //controller: controller,
                      style: const TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 14.0,
                      ),
                      decoration: const InputDecoration(
                        isDense: true,
                      ),
                      onFieldSubmitted: (value) {
                        // controller.text = value;
                      },
                    ),
                    ScreenUtil().setVerticalSpacing(16),
                    const Text(
                      "Sender Type",
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                    ScreenUtil().setVerticalSpacing(4),
                    DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,

                        decoration: InputDecoration(
                            isDense: true,
                            //contentPadding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFFB3B9C4), width: 1.0),
                                borderRadius: BorderRadius.circular(4.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFFD43232), width: 1.0),
                                borderRadius: BorderRadius.circular(4.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFFB3B9C4), width: 1.0),
                                borderRadius: BorderRadius.circular(4.0)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFFD43232), width: 1.0),
                                borderRadius: BorderRadius.circular(4.0))),
                        hint: Text('Choose Sender Type',
                            style: CustomTextStyle.getFont(
                                FlutterFlowTheme.of(context).primaryText,
                                14.0,
                                FontWeight.normal)),
                        items: const [],

                        validator: (value) {
                          if (value == null) {
                            return 'Please choose sender type';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          // _model.selectedSenderType = value;
                        },
                        icon: const Icon(Icons.keyboard_arrow_down_sharp,
                            color: Color(0xFF7A8699), size: 20),
                        alignment: Alignment.centerLeft,
                        // value: _model.selectedSenderType
                      ),
                    ),
                    ScreenUtil().setVerticalSpacing(4),
                    ScreenUtil().setVerticalSpacing(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        OutlinedButton(
                            onPressed: () {}, child: const Text("Cancel")),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text(isNewFlag ? "Save" : "Update"))
                      ],
                    ),
                    ScreenUtil().setVerticalSpacing(16),
                  ],
                ),
              ),
            ));
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final IconData iconData;

  const ButtonWidget(this.text, this.iconData, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(iconData, size: 24.0, color: Colors.white),
      label: Text(text,
          style: CustomTextStyle.getFont(
              FlutterFlowTheme.of(context).whiteColor, 14.0, FontWeight.w600)),
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
          backgroundColor: MaterialStateProperty.all(
              FlutterFlowTheme.of(context).buttonColor)),
    );
  }
}

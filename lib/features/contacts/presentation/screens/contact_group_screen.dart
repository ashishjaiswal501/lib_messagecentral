import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';

class ContactGroupScreen extends StatefulWidget {
  const ContactGroupScreen({super.key});

  @override
  State<ContactGroupScreen> createState() => _ContactGroupScreenState();
}

class _ContactGroupScreenState extends State<ContactGroupScreen> {
  Widget buildTextFieldSearch() {
    return SizedBox(
      width: 240.0,
      height: 44.0,
      child: TextField(
          // controller: _model.searchController,
          obscureText: false,
          style: const TextStyle(fontSize: 14),
          keyboardType: TextInputType.none,
          maxLines: 1,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: const OutlineInputBorder(),
              hintText: 'Search',
              hintStyle: const TextStyle(fontSize: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFB3B9C4),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFB3B9C4),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                  15.0, 15.0, 15.0, 15.0))),
    );
  }

  bool isChecked = true;
  void checkedBoxGroup() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 76.0,
            color: Colors.white,
            child: const Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: Text('Manage Group Contacts',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                )),
          ),
          const Divider(color: Color(0xFFDFE2E6), height: 1.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 10.0,
                  runSpacing: 10.0,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    buildTextFieldSearch(),
                    Wrap(spacing: 10.0, runSpacing: 10.0, children: [
                      Visibility(
                        visible: !isChecked,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.delete, size: 22.0),
                          label: const Text('Delete'),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.fromLTRB(
                                      12.0, 16.0, 12.0, 16.0)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.0))),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFF4493E))),
                        ),
                      ),
                      ElevatedButton.icon(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.fromLTRB(
                                    12.0, 16.0, 12.0, 16.0)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0))),
                          ),
                          onPressed: () {
                            showAddGroupWidget(context, true, controller);
                          },
                          icon: const Icon(Icons.add),
                          label: const Text("Add New Group"))
                    ])
                    /*Align(
                          alignment: AlignmentDirectional(1, 0.00),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 24.0),
                            child: ,
                          ),
                        )*/
                  ]),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
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
                        left: BorderSide(color: Color(0xFF091E42)),
                        right: BorderSide(color: Color(0xFF091E42)),
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
                      'Group Name',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    )),
                    DataColumn2(
                        // size: ColumnSize.M,
                        // fixedWidth: 120,
                        label: Text(
                      'Total Contracts',
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
                    DataRow(
                        onLongPress: () {
                          context.goNamed('contact',
                              pathParameters: {"id": "Ashish"});
                        },
                        cells: [
                          DataCell(Wrap(
                            spacing: 15,
                            runSpacing: 15,
                            children: [
                              InkWell(
                                  child: SvgPicture.asset(
                                      !isChecked
                                          ? 'assets/images/checkbox_mark.svg'
                                          : 'assets/images/checkbox_unmark.svg',
                                      width: 20.0,
                                      height: 20.0,
                                      fit: BoxFit.cover),
                                  onTap: () {
                                    checkedBoxGroup();
                                  }),
                              const Text("GA_2"),
                            ],
                          )),
                          const DataCell(Text("90")),
                          DataCell(Row(
                            children: [
                              Wrap(
                                  runSpacing: 15.0,
                                  spacing: 15.0,
                                  // alignment: alignment,
                                  children: [
                                    InkWell(
                                        child: const Icon(
                                            FontAwesomeIcons.penToSquare,
                                            color: Color(0xFF5D6B82),
                                            size: 16.0),
                                        onTap: () {
                                          showAddGroupWidget(
                                              context,
                                              false,
                                              TextEditingController.fromValue(
                                                  const TextEditingValue(
                                                      text: 'AMAN')));
                                        }),
                                    InkWell(
                                        child: const Icon(
                                            Icons.cloud_upload_outlined,
                                            color: Color(0xFF5D6B82),
                                            size: 20.0),
                                        onTap: () {
                                          // showUploadFileWidget(context, '');
                                        }),
                                    InkWell(
                                        child: const Icon(
                                            Icons.file_download_outlined,
                                            color: Color(0xFF5D6B82),
                                            size: 20.0),
                                        onTap: () {}),
                                    InkWell(
                                        child: const Icon(
                                            FontAwesomeIcons.trashCan,
                                            color: Color(0xFF5D6B82),
                                            size: 16.0),
                                        onTap: () {
                                          deleteGroupWidget(
                                            context,
                                            false,
                                          );
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
    );
  }

  Future<void> showAddGroupWidget(BuildContext context, bool isNewFlag,
      TextEditingController controller) async {
    final resultValue = await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Container(
            constraints: BoxConstraints(
                minHeight: 200,
                maxWidth: MediaQuery.sizeOf(context).width * 0.4),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
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
                      isNewFlag ? "Add New Group" : "Edit",
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
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
                ScreenUtil().setVerticalSpacing(16),
                const Divider(
                    color: Color.fromARGB(255, 211, 211, 212), height: 2.0),
                ScreenUtil().setVerticalSpacing(16),
                const Text(
                  "Group Name",
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                  ),
                ),
                ScreenUtil().setVerticalSpacing(4),
                TextFormField(
                  controller: controller,
                  style: const TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 14.0,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                  ),
                  onFieldSubmitted: (value) {
                    controller.text = value;
                  },
                ),
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
        );
      
      },
    );
    if (resultValue != null && resultValue == 'refresh_group') {
      //  _model.checkListMap.clear();
      //  _model.listViewPagingController?.refresh();
    }
  }

  Future<void> deleteGroupWidget(
    BuildContext context,
    bool isNewFlag,
  ) async {
    final resultValue = await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Container(
            constraints: BoxConstraints(
                minHeight: 200,
                maxWidth: MediaQuery.sizeOf(context).width * 0.3),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
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
                    const Text(
                      "Confirmation",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
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
                ScreenUtil().setVerticalSpacing(16),
                const Divider(
                    color: Color.fromARGB(255, 211, 211, 212), height: 2.0),
                ScreenUtil().setVerticalSpacing(16),
                Center(
                  child: SvgPicture.asset(
                    'assets/images/question_sign.svg',
                  ),
                ),
                ScreenUtil().setVerticalSpacing(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel")),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:const Color(0xFFF4493E),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Delete"))
                  ],
                ),
                ScreenUtil().setVerticalSpacing(16),
              ],
            ),
          ),
        );
      },
    );
    if (resultValue != null && resultValue == 'refresh_group') {
      //  _model.checkListMap.clear();
      //  _model.listViewPagingController?.refresh();
    }
  }
}

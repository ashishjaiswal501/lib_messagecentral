import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/features/add_credits/presentation/screens/widgets/file_uploading_widget.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key, this.groupName = ''});

  final String groupName;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 76.0,
            color: FlutterFlowTheme.of(context).primaryBackground,
            child: Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Group',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400)),
                      const Icon(Icons.chevron_right_rounded,
                          size: 26.0, color: Color(0xFF42526D)),
                      Text(groupName,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700)),
                    ],
                  ),
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
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add, size: 22.0),
                        label: const Text('Import'),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.fromLTRB(
                                    12.0, 16.0, 12.0, 16.0)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0))),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF2861B4))),
                      ),
                      OutlinedButton.icon(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.fromLTRB(
                                    12.0, 16.0, 12.0, 16.0)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0))),
                          ),
                          onPressed: () async {
                            //  showAddGroupWidget(context, true, null);
                            await showDialog(
                                context: context,
                                builder: (_) => const FileUploadingWidget());
                          },
                          icon: const Icon(Icons.add),
                          label: const Text("Add New Contact"))
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
                        //size: ColumnSize.M,

                        label: Text(
                      'Country Code',
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
                    DataRow(cells: [
                      const DataCell(Text("GA_2")),
                      const DataCell(Text("+91")),
                      const DataCell(Text("90")),
                      DataCell(Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                      // showAddGroupWidget(context, false, item);
                                    }),
                                InkWell(
                                    child: const Icon(FontAwesomeIcons.trashCan,
                                        color: Color(0xFF5D6B82), size: 16.0),
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
    );
  }

  Future<void> showAddGroupWidget(
      BuildContext context, bool isNewFlag, dynamic itemObj) async {
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
                    const Text(
                      "Add Contact",
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
                const Text(
                  "Mobile Number",
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                  ),
                ),
                ScreenUtil().setVerticalSpacing(4),
                TextFormField(),
                ScreenUtil().setVerticalSpacing(16),
                const Text(
                  "Contact Name",
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                  ),
                ),
                ScreenUtil().setVerticalSpacing(4),
                TextFormField(),
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
                    ElevatedButton(onPressed: () {}, child: const Text("Save"))
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

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/features/sms_message_now/presentation/screens/sms_sender_screen.dart';

class ManageTemplatesWidget extends StatefulWidget {
  const ManageTemplatesWidget({super.key});

  @override
  State<ManageTemplatesWidget> createState() => _ManageTemplatesWidgetState();
}

class _ManageTemplatesWidgetState extends State<ManageTemplatesWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: const AlignmentDirectional(1, 0.00),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 16.0, 10.0),
              child: InkWell(
                  child: const IgnorePointer(
                      child: ButtonWidget('Add New Template', Icons.add)),
                  onTap: () {
                    // showAddTemplateWidget(context, true, null);
                  }),
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
                              color: const Color.fromARGB(255, 247, 237, 209),
                              borderRadius: BorderRadius.circular(3)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          child: const Text(
                            "Pending",
                            style: TextStyle(
                                fontSize: 14, color: Colors.orangeAccent),
                          ))),
                      const DataCell(Text("14/09/2023")),
                      const DataCell(Text("-")),
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
    ));
  }
}

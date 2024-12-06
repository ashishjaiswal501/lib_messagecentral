import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/global_widgets/custom_button.dart';
import 'package:messagecentral/core/utils/extention_util.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/payment_history_cubit.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/payment_history_state.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:data_table_2/data_table_2.dart';

class PaymentHistoryWidget extends StatefulWidget {
  const PaymentHistoryWidget({super.key});

  @override
  State<PaymentHistoryWidget> createState() => _PaymentHistoryWidgetState();
}

class _PaymentHistoryWidgetState extends State<PaymentHistoryWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  CalendarFormat calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.enforced;
  DateTime? _paymentFromDate;
  DateTime? get paymentFromDate => _paymentFromDate;
  set paymentFromDate(DateTime? value) {
    setState(() {
      _paymentFromDate = value;
    });
  }

  DateTime? _paymentToDate;
  DateTime? get paymentToDate => _paymentToDate;
  set paymentToDate(DateTime? value) {
    setState(() {
      _paymentToDate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Wrap(
            spacing: 15.0,
            runSpacing: 15.0,
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.none,
            children: [
              FFButtonWidget(
                onPressed: () {},
                text: 'Here you can see your transactions done in last 90 days',
                icon: const FaIcon(
                  FontAwesomeIcons.circleInfo,
                  color: Color(0xFF0F8AB0),
                  size: 20.0,
                ),
                options: FFButtonOptions(
                  height: 44.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      12.0, 0.0, 12.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFFCAF2FF),
                  textStyle: GoogleFonts.getFont(
                    'Plus Jakarta Sans',
                    color: const Color(0xFF067699),
                    fontSize: 11.0,
                  ),
                  elevation: 0.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                showLoadingIndicator: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        MixPanelAnalyticsManager().sendEvent(
                            'Credits_date_range', 'Credits date range', null);
                        await showAlignedDialog(
                          context: context,
                          isGlobal: true,
                          avoidOverflow: false,
                          targetAnchor: const AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          followerAnchor: const AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          builder: (dialogContext) {
                            return StatefulBuilder(
                                builder: (context, stfstate) {
                              return Material(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                color: Colors.transparent,
                                child: SizedBox(
                                  width: 350,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Builder(builder: (context) {
                                              return TableCalendar(
                                                  headerStyle: const HeaderStyle(
                                                      titleTextStyle: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  firstDay: DateTime(
                                                      DateTime.now().year,
                                                      DateTime.now().month - 3,
                                                      DateTime.now().day),
                                                  lastDay: DateTime.now(),
                                                  focusedDay: _focusedDay,
                                                  selectedDayPredicate: (day) =>
                                                      isSameDay(
                                                          _selectedDay, day),
                                                  rangeStartDay: _rangeStart,
                                                  rangeEndDay: _rangeEnd,
                                                  calendarFormat:
                                                      calendarFormat,
                                                  rangeSelectionMode:
                                                      _rangeSelectionMode,
                                                  onRangeSelected:
                                                      (start, end, focusedDay) {
                                                    stfstate(
                                                      () {
                                                        _selectedDay = null;
                                                        _focusedDay =
                                                            focusedDay;
                                                        _rangeStart = start;
                                                        _rangeEnd = end;
                                                        _rangeSelectionMode =
                                                            _rangeSelectionMode;
                                                      },
                                                    );
                                                    // setState(() {
                                                    //   _selectedDay =
                                                    //       null;
                                                    //   _focusedDay =
                                                    //       focusedDay;
                                                    //   _rangeStart =
                                                    //       start;
                                                    //   _rangeEnd = end;
                                                    //   _rangeSelectionMode =
                                                    //       _rangeSelectionMode;
                                                    // });
                                                  });
                                            }),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      backgroundColor:
                                                          const Color(
                                                              0xFF215196),
                                                    ),
                                                    onPressed: () {
                                                      stfstate(() {
                                                        if (_rangeStart !=
                                                                null &&
                                                            _rangeEnd != null) {
                                                          paymentFromDate =
                                                              _rangeStart!;
                                                          // DateTime.parse(
                                                          //     date);
                                                          paymentToDate =
                                                              _rangeEnd;

                                                          Navigator.of(context)
                                                              .pop();
                                                        } else {
                                                          // message = "Please select the date range!";
                                                        }
                                                      });
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      child: Text("APPLY",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16.0)),
                                                    )))
                                          ]),
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Container(
                          width: 250.0,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: AppColors.primaryBackground,
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: const Color(0xFFB3B9C4),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 10.0, 15.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Color(0xFF7A8699),
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      "${paymentFromDate == null ? DateFormat.yMMMd('en').format(DateTime.now()) : DateFormat.yMMMd('en').format(paymentFromDate!)}  To  ${paymentToDate == null ? DateFormat.yMMMd('en').format(DateTime.now()) : DateFormat.yMMMd('en').format(paymentToDate!)}",
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: AppColors.primaryText,
                                        fontWeight: FontWeight.normal,
                                        fontSize:
                                            MediaQuery.sizeOf(context).width >=
                                                    800
                                                ? 12.0
                                                : 10.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        MixPanelAnalyticsManager().sendEvent(
                            'Credits_go_CTA', 'Credits go CTA', null);

                        context.read<PaymnetHistoryCubit>().getPaymentHistory(
                            fromDate: (DateFormat('dd/MM/yyyy')
                                .format(_paymentFromDate ?? DateTime.now())),
                            toDate: (DateFormat('dd/MM/yyyy')
                                .format(_paymentToDate ?? DateTime.now())));
                      },
                      text: 'Go',
                      options: FFButtonOptions(
                        height: 44.0,
                        elevation: 0.2,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
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
                        borderRadius: BorderRadius.circular(4.0),
                        hoverElevation: 5.0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Builder(builder: (context) {
            return BlocConsumer<PaymnetHistoryCubit, PaymentHistoryState>(
                listener: (context, state) {},
                buildWhen: (previous, current) => true,
                builder: (context, stateData) {
                  return stateData.when(
                      initial: () => const Center(),
                      empty: () => Container(
                            // height: MediaQuery.of(context).size.height / 1.5,
                            margin: const EdgeInsets.only(bottom: 20, top: 20),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: DataTable2(
                                    empty: const Center(
                                      child: Text(
                                        "No Data Available",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.primaryText,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    // dataRowColor: Colors.black,
                                    columnSpacing: 12,
                                    horizontalMargin: 12,
                                    minWidth: 600,
                                    smRatio: 0.75,
                                    lmRatio: 1.5,
                                    dataRowHeight: 46,
                                    headingRowHeight: 46,
                                    showBottomBorder: true,
                                    isHorizontalScrollBarVisible: true,
                                    isVerticalScrollBarVisible: true,
                                    headingRowDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: const Border(
                                          left: BorderSide(
                                              color: Color(0xFF091E42)),
                                          right: BorderSide(
                                              color: Color(0xFF091E42)),
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
                                    headingRowColor:
                                        MaterialStateColor.resolveWith(
                                            (states) =>
                                                const Color(0xFF091E42)),
                                    dividerThickness: 0.5,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    columns: const [
                                      DataColumn2(
                                          label: Center(
                                        child: Text(
                                          'Date',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      DataColumn2(
                                          label: Center(
                                        child: Text(
                                          'Type',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      DataColumn2(
                                          label: Center(
                                        child: Text(
                                          'Amount (\$)',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      DataColumn2(
                                          label: Center(
                                        child: Text(
                                          'Balance Before Purchase (\$)',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      DataColumn2(
                                          label: Center(
                                        child: Text(
                                          'Balance After Purchase (\$)',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                    ],
                                    rows: const []),
                              ),
                            ),
                          ),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      success: (payemntState) => Container(
                            // height: MediaQuery.of(context).size.height / 1.5,
                            margin: const EdgeInsets.only(top: 20),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: DataTable2(

                                    // dataRowColor: Colors.black,
                                    columnSpacing: 12,
                                    horizontalMargin: 12,
                                    minWidth: 1060,
                                    smRatio: 0.75,
                                    lmRatio: 1.5,
                                    dataRowHeight: 46,
                                    headingRowHeight: 46,
                                    showBottomBorder: true,
                                    isHorizontalScrollBarVisible: true,
                                    isVerticalScrollBarVisible: true,
                                    headingRowDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: const Border(
                                          left: BorderSide(
                                              color: Color(0xFF091E42)),
                                          right: BorderSide(
                                              color: Color(0xFF091E42)),
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
                                    dataTextStyle: GoogleFonts.getFont(
                                      'Plus Jakarta Sans',
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                    headingRowColor:
                                        MaterialStateColor.resolveWith(
                                            (states) =>
                                                const Color(0xFF091E42)),
                                    dividerThickness: 0.5,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    columns: const [
                                      DataColumn2(
                                          label: Center(
                                        child: Text(
                                          'Date',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      DataColumn2(
                                          label: Center(
                                        child: Text(
                                          'Type',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      DataColumn2(
                                          label: Center(
                                        child: Text(
                                          'Amount (\$)',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      DataColumn2(
                                          label: Center(
                                        child: Text(
                                          'Balance Before Purchase  (\$)',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      DataColumn2(
                                          label: Center(
                                        child: Text(
                                          'Balance After Purchase (\$)',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                    ],
                                    rows: List.generate(
                                      payemntState.data!.length,
                                      (index) => DataRow2(
                                          color: MaterialStatePropertyAll(
                                              index % 2 == 0
                                                  ? AppColors.primaryBackground
                                                  : AppColors
                                                      .secondaryBackground),
                                          cells: [
                                            DataCell(Center(
                                              child: Text(
                                                DateFormat('dd/MM/yyyy').format(
                                                    payemntState.data![index]
                                                        .transactionDateTime!),
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                            DataCell(Center(
                                              child: Text(
                                                payemntState
                                                    .data![index].creditsType!,
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                            DataCell(Center(
                                              child: Text(
                                                currencyFormat(payemntState
                                                    .data![index]
                                                    .creditsPurchased)!,
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                            DataCell(Center(
                                              child: Text(
                                                currencyFormat(payemntState
                                                    .data![index]
                                                    .balanceBeforePurchased)!,
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                            DataCell(Center(
                                              child: Text(
                                                currencyFormat(payemntState
                                                    .data![index]
                                                    .balanceAfterPurchased)!,
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                          ]),
                                    )

                                    // ],

                                    ),
                              ),
                            ),
                          ),
                      error: (error) => Center(
                              child: Text(
                            error,
                            style: const TextStyle(color: Colors.black),
                          )));
                });
          }),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

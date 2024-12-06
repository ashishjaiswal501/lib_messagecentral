import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/global_widgets/circular_chart_widget.dart';
import 'package:messagecentral/core/global_widgets/custom_button.dart';
import 'package:messagecentral/core/global_widgets/global_widgets.dart';
import 'package:messagecentral/core/global_widgets/grid_widget.dart';
import 'package:messagecentral/core/utils/extention_util.dart';
import 'package:messagecentral/core/utils/firebase_analytics_functions.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_analytics_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_analytics_state.dart';

import 'package:table_calendar/table_calendar.dart';

class SMSServiceScreen extends StatefulWidget {
  const SMSServiceScreen({super.key});

  @override
  State<SMSServiceScreen> createState() => _SMSServiceScreenState();
}

class _SMSServiceScreenState extends State<SMSServiceScreen> {
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
  void initState() {
    super.initState();
   
    MixPanelAnalyticsManager()
        .sendEvent('SMS_Service_landing', 'SMS Service landing', null);
    setScreenFirebase('SMS_Service_landing', 'SMS Service landing');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'SMS Service Analytics',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryTextColor,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
                  child: Row(
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
                                'SMS_Service_date_range',
                                'SMS Service date range',
                                null);
                            await showAlignedDialog(
                              context: context,
                              isGlobal: true,
                              avoidOverflow: false,
                              targetAnchor: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              followerAnchor:
                                  const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                              builder: (dialogContext) {
                                return StatefulBuilder(
                                    builder: (context, stfstate) {
                                  return Material(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
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
                                                          titleTextStyle:
                                                              TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                      firstDay: DateTime(
                                                          DateTime.now().year,
                                                          DateTime.now()
                                                                  .month -
                                                              3,
                                                          DateTime.now().day),
                                                      lastDay: DateTime.now(),
                                                      focusedDay: _focusedDay,
                                                      selectedDayPredicate:
                                                          (day) => isSameDay(
                                                              _selectedDay,
                                                              day),
                                                      rangeStartDay:
                                                          _rangeStart,
                                                      rangeEndDay: _rangeEnd,
                                                      calendarFormat:
                                                          calendarFormat,
                                                      rangeSelectionMode:
                                                          _rangeSelectionMode,
                                                      onRangeSelected: (start,
                                                          end, focusedDay) {
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
                                                      });
                                                }),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          backgroundColor:
                                                              const Color(
                                                                  0xFF215196),
                                                        ),
                                                        onPressed: () {
                                                          stfstate(() {
                                                            if (_rangeStart !=
                                                                    null &&
                                                                _rangeEnd !=
                                                                    null) {
                                                              paymentFromDate =
                                                                  _rangeStart!;
                                                              // DateTime.parse(
                                                              //     date);
                                                              paymentToDate =
                                                                  _rangeEnd;
    
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            } else {
                                                              // message = "Please select the date range!";
                                                            }
                                                          });
                                                        },
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text("APPLY",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      16.0)),
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
                                //color: AppColors.primaryBackground,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      color: Color(0xFF7A8699),
                                      size: 20.0,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          "${paymentFromDate == null ? DateFormat.yMMMd('en').format(DateTime.now()) : DateFormat.yMMMd('en').format(paymentFromDate!)}  To  ${paymentToDate == null ? DateFormat.yMMMd('en').format(DateTime.now()) : DateFormat.yMMMd('en').format(paymentToDate!)}",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: AppColors.primaryText,
                                            fontWeight: FontWeight.normal,
                                            fontSize: MediaQuery.sizeOf(context)
                                                        .width >=
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            MixPanelAnalyticsManager().sendEvent(
                                'SMS_Service_go_CTA',
                                'SMS Service go CTA',
                                null);
                            context.read<SMSAnalyticsCubit>().getAnalytics(
                                fromDate: (DateFormat('dd/MM/yyyy')
                                    .format(paymentFromDate ?? DateTime.now())),
                                toDate: (DateFormat('dd/MM/yyyy')
                                    .format(paymentToDate ?? DateTime.now())));
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
                  ),
                )
              ],
            ),
          ),
          BlocBuilder<SMSAnalyticsCubit, SMSAnalyticsState>(
              builder: (context, state) {
            return state.when(
                initial: () => const Center(),
                loading: () => const Center(
                    // child: CircularProgressIndicator(),
                    ),
                empty: () => const Center(),
                success: (analytics) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Overview',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .primaryTextColor
                                  .withOpacity(0.85),
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        GridWidget(
                          childrengridItem: [
                            GlobalWidgets.buildGridItem(
                              title: 'SMS Requested',
                              value:
                                  analytics.analyticsData?.sent?.toString() ??
                                      "0",
                              color: const Color(0xFF215196),
                            ),
                            GlobalWidgets.buildGridItem(
                              title: 'SMS Sent',
                              value:
                                  analytics.analyticsData?.sent?.toString() ??
                                      "0",
                              color: const Color(0xFF0E7E3E),
                            ),
                            GlobalWidgets.buildGridItem(
                              title: 'SMS Delivered',
                              value:
                                  "${analytics.analyticsData?.delivered ?? 0}",
                              color: const Color(0xFF20A4CD),
                            ),
                            GlobalWidgets.buildGridItem(
                              title: 'Delivered Percentage',
                              value:
                                  "${analytics.analyticsData?.deliveredPercentage?.toStringAsFixed(1) ?? 0}%",
                              color: const Color(0xFF6215DD),
                            ),
                            GlobalWidgets.buildGridItem(
                              title: 'SMS Failed',
                              value:
                                  analytics.analyticsData?.failed?.toString() ??
                                      "0",
                              color: const Color(0xFFE03227),
                            ),
                            GlobalWidgets.buildGridItem(
                              title: 'Total Cost',
                              value:
                                  "${currencyFormatFiveDecimal(analytics.analyticsData?.totalCost ?? 0, totalDigits: 3)}",
                              color: const Color(0xFF243757),
                            ),
                          ],
                        ),
                      ],
                    ),
                error: (error) => Center(
                      child: Text(error),
                    ));
          }),
          ScreenUtil().setVerticalSpacing(25),
          BlocBuilder<SMSAnalyticsCubit, SMSAnalyticsState>(
              builder: (context, state) {
            return state.maybeWhen(
              success: (analyticsEntity) {
                return Visibility(
                  visible: analyticsEntity
                          .analyticsData?.countryWiseCount?.isNotEmpty ??
                      false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment:
                                  const AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                child: Text(
                                  'Top 10 Country wise SMS Recipient',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont(
                                    'Plus Jakarta Sans',
                                    color: const Color(0xFF215196),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                            CircularChartWidget(
                                chartDatalist: analyticsEntity
                                        .analyticsData?.countryWiseCount ??
                                    [])
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 25.0, 0.0, 0.0),
                        child: Text(
                          'Country Breakdown',
                          style: GoogleFonts.getFont(
                            'Plus Jakarta Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFF091E42),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DataTable(
                                  // dataRowColor: Colors.black,
                                  border: TableBorder.symmetric(
                                      outside: const BorderSide(
                                    color: Color(0xFFDFE2E6),
                                  )),
                                  headingTextStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        MediaQuery.sizeOf(context).width >= 800
                                            ? 14.0
                                            : 8.0,
                                  ),
                                  headingRowColor:
                                      const MaterialStatePropertyAll(
                                    Color(0xFF091E42),
                                  ),
                                  dividerThickness: 0.5,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  columns: const [
                                    DataColumn(
                                        label: Flexible(
                                      child: Center(
                                        child: Text(
                                          'Country',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )),
                                    DataColumn(
                                        label: Flexible(
                                      child: Center(
                                        child: Text(
                                          'Requested',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )),
                                    // DataColumn(
                                    //     label: Flexible(
                                    //   child: Center(
                                    //     child: Text(
                                    //       'Verified',
                                    //       maxLines: 2,
                                    //       softWrap: true,
                                    //       textAlign: TextAlign.center,
                                    //     ),
                                    //   ),
                                    // )),
                                    DataColumn(
                                        label: Flexible(
                                      child: Center(
                                        child: Text(
                                          'Delivered',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )),
                                    DataColumn(
                                        label: Flexible(
                                      child: Center(
                                        child: Text(
                                          'Failed to deliver',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )),
                                    DataColumn(
                                        label: Flexible(
                                      child: Center(
                                        child: Text(
                                          'Cost (\$)',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )),
                                  ],
                                  rows: List.generate(
                                    analyticsEntity.analyticsData!
                                        .countryWiseCount!.length,
                                    (index) => DataRow(
                                        color: MaterialStatePropertyAll(
                                            index % 2 == 0
                                                ? AppColors.primaryBackground
                                                : AppColors
                                                    .secondaryBackground),
                                        cells: [
                                          DataCell(Center(
                                            child: Text(
                                              analyticsEntity
                                                  .analyticsData!
                                                  .countryWiseCount![index]
                                                  .countryName
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                          DataCell(Center(
                                            child: Text(
                                              analyticsEntity.analyticsData!
                                                  .countryWiseCount![index].sent
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                          // DataCell(Center(
                                          //   child: Row(
                                          //     mainAxisAlignment:
                                          //         MainAxisAlignment.center,
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.center,
                                          //     children: [
                                          //       Text(
                                          //         analyticsEntity
                                          //             .analyticsData!
                                          //             .countryWiseCount![
                                          //                 index]
                                          //             .verified
                                          //             .toString(),
                                          //         textAlign:
                                          //             TextAlign.center,
                                          //       ),
                                          //       Padding(
                                          //         padding:
                                          //             const EdgeInsetsDirectional
                                          //                 .fromSTEB(4.0,
                                          //                 4.0, 0.0, 4.0),
                                          //         child: Container(
                                          //           width: 44.0,
                                          //           height: 44.0,
                                          //           decoration:
                                          //               const BoxDecoration(
                                          //             shape:
                                          //                 BoxShape.circle,
                                          //           ),
                                          //           child: Align(
                                          //             alignment:
                                          //                 const AlignmentDirectional(
                                          //                     0.00, 0.00),
                                          //             child:
                                          //                 CircularPercentIndicator(
                                          //               percent:
                                          //                   findPercentage(
                                          //                 analyticsEntity
                                          //                     .analyticsData!
                                          //                     .countryWiseCount![
                                          //                         index]
                                          //                     .sent,
                                          //                 analyticsEntity
                                          //                     .analyticsData!
                                          //                     .countryWiseCount![
                                          //                         index]
                                          //                     .verified,
                                          //               )!,
                                          //               radius: 20.0,
                                          //               lineWidth: 4.0,
                                          //               animation: true,
                                          //               progressColor:
                                          //                   const Color(
                                          //                       0xFF39A968),
                                          //               backgroundColor:
                                          //                   const Color(
                                          //                       0xFFDDF3E6),
                                          //               center: Text(
                                          //                 '${findPercentageText(
                                          //                   analyticsEntity
                                          //                       .analyticsData!
                                          //                       .countryWiseCount![
                                          //                           index]
                                          //                       .sent,
                                          //                   analyticsEntity
                                          //                       .analyticsData!
                                          //                       .countryWiseCount![
                                          //                           index]
                                          //                       .verified,
                                          //                 ).toString()}%',
                                          //                 style: GoogleFonts
                                          //                     .getFont(
                                          //                   'Plus Jakarta Sans',
                                          //                   color: const Color(
                                          //                       0xFF091E42),
                                          //                   fontWeight:
                                          //                       FontWeight
                                          //                           .w600,
                                          //                   fontSize: 10.0,
                                          //                 ),
                                          //               ),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // )),
    
                                          DataCell(Center(
                                            child: Text(
                                              analyticsEntity
                                                  .analyticsData!
                                                  .countryWiseCount![index]
                                                  .delivered
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                          DataCell(Center(
                                            child: Text(
                                              analyticsEntity
                                                  .analyticsData!
                                                  .countryWiseCount![index]
                                                  .failed
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                          DataCell(Center(
                                            child: Text(
                                              analyticsEntity
                                                  .analyticsData!
                                                  .countryWiseCount![index]
                                                  .cost!
                                                  .toStringAsFixed(3),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                        ]),
                                  )),
                            ),
                          ))
                    ],
                  ),
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          }),
        ],
      ),
    );
  }
}

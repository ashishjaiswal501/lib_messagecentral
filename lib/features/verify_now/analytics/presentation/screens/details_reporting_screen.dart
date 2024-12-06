import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/global_widgets/custom_button.dart';
import 'package:messagecentral/core/utils/firebase_analytics_functions.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/core/utils/responsive_layout.dart';
import 'package:messagecentral/features/verify_now/analytics/data/data_sources/remote/download_file_api_service.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/otp_details_reporting_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/otp_details_reporting_state.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/otp_search_details_reporting_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/otp_search_details_reporting_state.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_details_reporting_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_details_reporting_state.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_search_details_reporting_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_search_details_reporting_state.dart';
import 'package:table_calendar/table_calendar.dart';

class DetailsReportingScreen extends StatefulWidget {
  const DetailsReportingScreen({super.key});

  @override
  State<DetailsReportingScreen> createState() => _DetailsReportingScreenState();
}

class _DetailsReportingScreenState extends State<DetailsReportingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    MixPanelAnalyticsManager()
        .sendEvent("Reports_CTA_landing", "Reports CTA landing", null);
    setScreenFirebase(
      "Reports_CTA_landing",
      "Reports CTA landing",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          centerTitle: false,
          backgroundColor: Colors.white,
          toolbarHeight: 76.5,
          shadowColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 50,
                  width: 150.w,
                  child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    controller: _tabController,
                    indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                      width: 3,
                      color: Color(0xFF2861B4),
                    )),
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.black,
                    dividerColor: AppColors.black50,
                    tabs: const [
                      Tab(
                        text: "OTP User Verification",
                      ),
                      Tab(
                        text: "SMS User Verification",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            "User Detail Reporting",
            style: GoogleFonts.getFont(
              'Plus Jakarta Sans',
              color: FlutterFlowTheme.of(context).primaryTextColor,
              letterSpacing: 0.02,
              fontWeight: FontWeight.w600,
              fontSize: 22.0,
            ),
          ),
        ),
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: const [
              OtpReports(),
              SMSReports(),
            ]));
  }
}

class OtpReports extends StatefulWidget {
  const OtpReports({super.key});

  @override
  State<OtpReports> createState() => _OtpReportsState();
}

class _OtpReportsState extends State<OtpReports> {
  int currentPage = 1;
  int itemsPerPage = 10;
  int totalItems = 0; //detailsReportingState.data!.count
  //int totalPages =2;  //  (detailsReportingState.data!.count! / itemsPerPage).ceil();   // Dynaicly calculating for.  ForLoop of pagination from
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  CalendarFormat calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.enforced;
  DateTime? _createdFromDate;
  DateTime? get createdFromDate => _createdFromDate;

  bool _isSearching = false;

  set createdFromDate(DateTime? value) {
    setState(() {
      _createdFromDate = value;
    });
  }

  DateTime? _deliverdToDate;
  DateTime? get deliverdToDate => _deliverdToDate;
  set deliverdToDate(DateTime? value) {
    setState(() {
      _deliverdToDate = value;
    });
  }

  @override
  void initState() {
    super.initState();
    MixPanelAnalyticsManager()
        .sendEvent("Reports_OTP_User_CTA", "Reports_OTP_User_CTA", null);
  }

  String searchQueary = '';
  int totalCount = 0;
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: 15.0,
          runSpacing: 15.0,
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.start,
          verticalDirection: VerticalDirection.down,
          clipBehavior: Clip.none,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: const TextStyle(fontSize: 14),
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                              color: Color(0xFFB3B9C4), width: 1.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onSubmitted: (value) {
                        searchController.text = value;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            _isSearching = true;
                          });

                          // Trigger the search
                          context
                              .read<OtpSearchDetailsReportingCubit>()
                              .otpGetDetailsReporting(
                                  query: searchController.text,
                                  pageNo: '0',
                                  //size: '10',
                                  size: itemsPerPage.toString(),
                                  type: 'OTP');
                        } else {
                          setState(() {
                            _isSearching = false;
                            searchQueary = '';
                            currentPage = 1;
                          });
                          // Optionally trigger a reset or default fetch
                          MixPanelAnalyticsManager().sendEvent(
                              "Reports_OTP_Search", "Reports OTP_Search", null);
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() {
                        _selectedDay = null;
                        _rangeStart = null;
                        _rangeEnd = null;
                        calendarFormat = CalendarFormat.month;
                        _rangeSelectionMode = RangeSelectionMode.enforced;
                        itemsPerPage = 10;
                        currentPage = 1;
                        // currentPage = 0;
                        _isSearching = false;
                        searchQueary = "";
                      });
                      deliverdToDate = DateTime.now();
                      createdFromDate = DateTime.now();
                      _focusedDay = DateTime.now();

                      searchController.clear();
                      context
                          .read<OtpDetailsReportingCubit>()
                          .getDetailsReporting(
                              from: (DateFormat('d/M/yyyy')
                                  .format(DateTime.now())),
                              to: (DateFormat('d/M/yyyy')
                                  .format(DateTime.now())),
                              pageNo: "0",
                              size: "10");
                      MixPanelAnalyticsManager().sendEvent(
                          "Reports_OTP_Reset", "Reports OTP Reset", null);
                    },
                    text: 'Reset',
                    options: FFButtonOptions(
                      height: 44.0,
                      elevation: 0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF2861B4),
                      textStyle: TextStyle(
                        color: AppColors.whiteTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: isDesktop(context) ? 14 : 11,
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
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AbsorbPointer(
                    absorbing: _isSearching,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 0, right: 20),
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
                                    "Reports_OTP_date_range",
                                    "Reports OTP date range",
                                    null);
                                await showAlignedDialog(
                                  context: context,
                                  isGlobal: true,
                                  avoidOverflow: false,
                                  targetAnchor:
                                      const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                  followerAnchor:
                                      const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                  builder: (dialogContext) {
                                    return StatefulBuilder(
                                        builder: (context, stfstate) {
                                      return Material(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
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
                                                                      FontWeight
                                                                          .w500)),
                                                          firstDay: DateTime(
                                                              DateTime.now()
                                                                  .year,
                                                              DateTime.now()
                                                                      .month -
                                                                  3,
                                                              DateTime.now()
                                                                  .day),
                                                          lastDay: DateTime
                                                              .now(),
                                                          focusedDay:
                                                              _focusedDay,
                                                          selectedDayPredicate:
                                                              (day) =>
                                                                  isSameDay(
                                                                      _selectedDay,
                                                                      day),
                                                          rangeStartDay:
                                                              _rangeStart,
                                                          rangeEndDay:
                                                              _rangeEnd,
                                                          calendarFormat:
                                                              calendarFormat,
                                                          rangeSelectionMode:
                                                              _rangeSelectionMode,
                                                          onRangeSelected:
                                                              (start, end,
                                                                  focusedDay) {
                                                            stfstate(
                                                              () {
                                                                _selectedDay =
                                                                    null;
                                                                _focusedDay =
                                                                    focusedDay;
                                                                _rangeStart =
                                                                    start;
                                                                _rangeEnd = end;
                                                                _rangeSelectionMode =
                                                                    _rangeSelectionMode;
                                                              },
                                                            );
                                                          });
                                                    }),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
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
                                                                  _createdFromDate =
                                                                      _rangeStart!;
                                                                  deliverdToDate =
                                                                      _rangeEnd;

                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                } else {}
                                                              });
                                                            },
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Text(
                                                                  "APPLY",
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
                                      color: AppColors.primaryBackground,
                                      borderRadius: BorderRadius.circular(4.0),
                                      border: Border.all(
                                        color: const Color(0xFFB3B9C4),
                                        width: 1.0,
                                      )),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
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
                                              "${_createdFromDate == null ? DateFormat.yMMMd('en').format(DateTime.now()) : DateFormat.yMMMd('en').format(_createdFromDate!)}  To  ${deliverdToDate == null ? DateFormat.yMMMd('en').format(DateTime.now()) : DateFormat.yMMMd('en').format(deliverdToDate!)}",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontWeight: FontWeight.normal,
                                                fontSize:
                                                    MediaQuery.sizeOf(context)
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
                                context
                                    .read<OtpDetailsReportingCubit>()
                                    .getDetailsReporting(
                                      from: (DateFormat('d/M/yyyy').format(
                                          _createdFromDate ?? DateTime.now())),
                                      to: (DateFormat('d/M/yyyy').format(
                                          _deliverdToDate ?? DateTime.now())),
                                      // pageNo: '0',
                                      // size: '10'
                                      pageNo: (currentPage - 1).toString(),
                                      // size: itemsPerPage.toString(),
                                      // pageNo: (currentPage - 1).toString(),
                                      size: itemsPerPage.toString(),
                                    );
                                MixPanelAnalyticsManager().sendEvent(
                                    "Reports_OTP_go_CTA",
                                    "Reports OTP go CTA",
                                    null);
                              },
                              text: 'Go',
                              options: FFButtonOptions(
                                height: 44.0,
                                elevation: 0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF2861B4),
                                textStyle: TextStyle(
                                    color: AppColors.whiteTextColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: isDesktop(context) ? 14 : 11),
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 0, right: 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(30.w, 52), elevation: 0),
                      onPressed: () {
                        downloadFile(
                            LocalStateCache().authToken,
                            LocalStateCache().customerId,
                            _createdFromDate != null
                                ? DateFormat('dd/MM/yyyy')
                                    .format(_createdFromDate!)
                                : DateFormat('dd/MM/yyyy')
                                    .format(DateTime.now()),
                            _deliverdToDate != null
                                ? DateFormat('dd/MM/yyyy')
                                    .format(_deliverdToDate!)
                                : DateFormat('dd/MM/yyyy')
                                    .format(DateTime.now()),
                            'OTP');
                        MixPanelAnalyticsManager().sendEvent(
                            "Reports_OTP_download_report",
                            "Reports OTP download report",
                            null);
                      },
                      child: Text(
                        'Download Report',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: isDesktop(context) ? 16 : 11,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Visibility(
            visible: !_isSearching,
            replacement: BlocConsumer<OtpSearchDetailsReportingCubit,
                    OtpSearchDetailsReportingState>(
                listener: (context, state) {},
                buildWhen: (previous, current) => true,
                builder: (context, stateData) {
                  return stateData.when(
                      initial: () => const Center(),
                      empty: () => Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
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
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Submitted',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      // size: ColumnSize.M,
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Delivered',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      //size: ColumnSize.L,
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Mobile Number',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.start,
                                        ),
                                      )),
                                  DataColumn2(
                                      fixedWidth: 455,
                                      // MediaQuery.of(context).size.width /
                                      //     3,
                                      label: Center(
                                        child: Text(
                                          'Content',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      size: ColumnSize.M,
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Status',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      label: Center(
                                    child: Text(
                                      'Error code',
                                      maxLines: 2,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                                ],
                                rows: const []),
                          ),
                      loading: () => Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 7),
                            child: const Center(
                                child: CircularProgressIndicator()),
                          ),
                      success: (detailsReportingState) => Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child:
                               DataTable2(
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
                                  dataTextStyle: GoogleFonts.getFont(
                                    'Plus Jakarta Sans',
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
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
                                          (states) => const Color(0xFF091E42)),
                                  dividerThickness: 0.5,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  columns: const [
                                    DataColumn2(
                                        //size: ColumnSize.M,
                                        fixedWidth: 120,
                                        label: Center(
                                          child: Text(
                                            'Submitted',
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    DataColumn2(
                                        // size: ColumnSize.M,
                                        fixedWidth: 120,
                                        label: Center(
                                          child: Text(
                                            'Delivered',
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    DataColumn2(
                                        //size: ColumnSize.L,
                                        fixedWidth: 120,
                                        label: Center(
                                          child: Text(
                                            'Mobile Number',
                                            maxLines: 2,
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        )),
                                    DataColumn2(
                                        fixedWidth: 455,
                                        // MediaQuery.of(context).size.width /
                                        //     3,
                                        label: Center(
                                          child: Text(
                                            'Content',
                                            maxLines: 2,
                                            softWrap: true,
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    DataColumn2(
                                        size: ColumnSize.M,
                                        fixedWidth: 120,
                                        label: Center(
                                          child: Text(
                                            'Status',
                                            maxLines: 2,
                                            softWrap: true,
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    DataColumn2(
                                        label: Center(
                                      child: Text(
                                        'Error code',
                                        maxLines: 2,
                                        softWrap: true,
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                  ],
                                  rows: List.generate(
                                    detailsReportingState.data!.data!.length,
                                    (index) => DataRow(
                                        color: MaterialStatePropertyAll(
                                            index % 2 == 0
                                                ? AppColors.primaryBackground
                                                : AppColors
                                                    .secondaryBackground),
                                        cells: [
                                          DataCell(Center(
                                            child: Text(
                                              '${DateFormat('d/M').format(detailsReportingState.data!.data![index].createdAt!)} | ${DateFormat('HH:mm').format(detailsReportingState.data!.data![index].createdAt!)}',
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.primaryText),
                                            ),
                                          )),
                                          DataCell(Center(
                                            child: Text(
                                              detailsReportingState
                                                          .data!
                                                          .data![index]
                                                          .deliveredAt ==
                                                      null
                                                  ? "NA"
                                                  : '${DateFormat('d/M').format(detailsReportingState.data!.data![index].deliveredAt!)} | ${DateFormat('HH:mm').format(detailsReportingState.data!.data![index].deliveredAt!)}',
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.primaryText),
                                            ),
                                          )),
                                          DataCell(Center(
                                            child: Text(
                                              detailsReportingState.data!
                                                  .data![index].mobileNumber!,
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  color: AppColors.primaryText),
                                            ),
                                          )),
                                          DataCell(Text(
                                            detailsReportingState.data!
                                                .data![index].messageBody!,
                                            textAlign: TextAlign.start,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                color: AppColors.primaryText),
                                          )),
                                          DataCell(
                                            Center(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                  color: detailsReportingState
                                                              .data!
                                                              .data![index]
                                                              .status ==
                                                          "DELIVRD"
                                                      ? const Color(0xFFDDFFEB)
                                                      : const Color(0xFFFCD3D0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Text(
                                                  detailsReportingState.data!
                                                      .data![index].status!
                                                      .toUpperCase(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: detailsReportingState
                                                                .data!
                                                                .data![index]
                                                                .status ==
                                                            "DELIVRD"
                                                        ? const Color(
                                                            0xFF0CB653)
                                                        : const Color(
                                                            0xFFE03227),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(Center(
                                            child: Text(
                                              detailsReportingState.data!
                                                  .data![index].errorCode!,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.primaryText),
                                            ),
                                          )),
                                        ]),
                                  )

                                  // ],

                                  ),
                           
                            ),
                          ),
                      error: (error) => Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 3),
                            child: Center(
                                child: Text(
                              error,
                              style: const TextStyle(color: Colors.black),
                            )),
                          ));
                }),
            child: BlocConsumer<OtpDetailsReportingCubit,
                    OtpDetailsReportingState>(
                listener: (context, state) {},
                builder: (context, stateDatas) {
                  return stateDatas.when(
                      initial: () => const Center(),
                      empty: () => Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
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
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Submitted',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      // size: ColumnSize.M,
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Delivered',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      //size: ColumnSize.L,
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Mobile Number',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.start,
                                        ),
                                      )),
                                  DataColumn2(
                                      fixedWidth: 455,
                                      // MediaQuery.of(context).size.width /
                                      //     3,
                                      label: Center(
                                        child: Text(
                                          'Content',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      size: ColumnSize.M,
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Status',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      label: Center(
                                    child: Text(
                                      'Error code',
                                      maxLines: 2,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                                ],
                                rows: const []),
                          ),
                      loading: () => Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 6),
                            child: const Center(
                                child: CircularProgressIndicator()),
                          ),
                      success: (detailsReportingState) => Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: DataTable2(
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
                                  dataTextStyle: GoogleFonts.getFont(
                                    'Plus Jakarta Sans',
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
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
                                          (states) => const Color(0xFF091E42)),
                                  dividerThickness: 0.5,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  columns: const [
                                    DataColumn2(
                                        //size: ColumnSize.M,
                                        fixedWidth: 120,
                                        label: Center(
                                          child: Text(
                                            'Submitted',
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    DataColumn2(
                                        // size: ColumnSize.M,
                                        fixedWidth: 120,
                                        label: Center(
                                          child: Text(
                                            'Delivered',
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    DataColumn2(
                                        //size: ColumnSize.L,
                                        fixedWidth: 120,
                                        label: Center(
                                          child: Text(
                                            'Mobile Number',
                                            maxLines: 2,
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        )),
                                    DataColumn2(
                                        fixedWidth: 455,
                                        // MediaQuery.of(context).size.width /
                                        //     3,
                                        label: Center(
                                          child: Text(
                                            'Content',
                                            maxLines: 2,
                                            softWrap: true,
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    DataColumn2(
                                        size: ColumnSize.M,
                                        fixedWidth: 120,
                                        label: Center(
                                          child: Text(
                                            'Status',
                                            maxLines: 2,
                                            softWrap: true,
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    DataColumn2(
                                        label: Center(
                                      child: Text(
                                        'Error code',
                                        maxLines: 2,
                                        softWrap: true,
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                  ],
                                  rows: List.generate(
                                    detailsReportingState.data!.data!.length,
                                    (index) => DataRow(
                                        color: MaterialStatePropertyAll(
                                            index % 2 == 0
                                                ? AppColors.primaryBackground
                                                : AppColors
                                                    .secondaryBackground),
                                        cells: [
                                          DataCell(Center(
                                            child: Text(
                                              '${DateFormat('d/M').format(detailsReportingState.data!.data![index].createdAt!)} | ${DateFormat('HH:mm').format(detailsReportingState.data!.data![index].createdAt!)}',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  color: AppColors.primaryText),
                                            ),
                                          )),
                                          DataCell(Center(
                                            child: Text(
                                              detailsReportingState
                                                          .data!
                                                          .data![index]
                                                          .deliveredAt ==
                                                      null
                                                  ? "NA"
                                                  : '${DateFormat('d/M').format(detailsReportingState.data!.data![index].deliveredAt!)} | ${DateFormat('HH:mm').format(detailsReportingState.data!.data![index].deliveredAt!)}',
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.primaryText),
                                            ),
                                          )),
                                          DataCell(Center(
                                            child: Text(
                                              detailsReportingState.data!
                                                  .data![index].mobileNumber!,
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  color: AppColors.primaryText),
                                            ),
                                          )),
                                          DataCell(Text(
                                            detailsReportingState.data!
                                                .data![index].messageBody!,
                                            textAlign: TextAlign.start,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          )),
                                          DataCell(
                                            Center(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                  color: detailsReportingState
                                                              .data!
                                                              .data![index]
                                                              .status ==
                                                          "DELIVRD"
                                                      ? const Color(0xFFDDFFEB)
                                                      : const Color(0xFFFCD3D0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Text(
                                                  detailsReportingState.data!
                                                      .data![index].status!
                                                      .toUpperCase(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: detailsReportingState
                                                                .data!
                                                                .data![index]
                                                                .status ==
                                                            "DELIVRD"
                                                        ? const Color(
                                                            0xFF0CB653)
                                                        : const Color(
                                                            0xFFE03227),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(Center(
                                            child: Text(
                                              detailsReportingState.data!
                                                  .data![index].errorCode!,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.primaryText),
                                            ),
                                          )),
                                        ]),
                                  )),
                            ),
                          ),
                      error: (error) => Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 3),
                            child: Center(
                                child: Text(
                              error,
                              style: const TextStyle(color: Colors.black),
                            )),
                          ));
                }),
          ),
        ),
        // Container(color: Colors.white, child: const Divider()),
        Visibility(
          visible: !_isSearching,
          replacement: BlocBuilder<OtpSearchDetailsReportingCubit,
              OtpSearchDetailsReportingState>(builder: (context, state) {
            return state.when(
                empty: () => const Center(),
                error: (errorMessage) => const Center(),
                loading: () => const Center(),
                initial: () => const Center(),
                success: (detailsReportingState) => Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            children: [
                              DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  value: itemsPerPage,
                                  onChanged: (int? newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        itemsPerPage = newValue;
                                        currentPage = 1;
                                        // Reset to first page when changing items per page
                                        // totalPages =
                                        //     (detailsReportingState.data!.count! / itemsPerPage)
                                        //         .ceil();
                                      });
                                      searchQueary = '';
                                      //  searchController.clear();

                                      context
                                          .read<
                                              OtpSearchDetailsReportingCubit>()
                                          .otpGetDetailsReporting(
                                            query: searchController.text,
                                            type: "OTP",
                                            pageNo:
                                                (currentPage - 1).toString(),
                                            size: itemsPerPage.toString(),
                                          );
                                    }
                                  },
                                  items: [5, 10, 15, 20].map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(
                                        'Lines per page: $value',
                                        style: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          color: const Color(0xFF2861B4),
                                          fontWeight: FontWeight.w600,
                                          fontSize: MediaQuery.sizeOf(context)
                                                      .width >=
                                                  800
                                              ? 14.0
                                              : 8.0,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),

                          //Pegination details
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Text showing current page status
                                  Text(
                                    //  ' ${currentPage} - $itemsPerPage of ${detailsReportingState.data!.count}',
                                    //"${currentPage > 0 ? currentPage : 1} - $itemsPerPage of ${detailsReportingState.data!.count}",
                                    "$currentPage - $itemsPerPage of ${detailsReportingState.data!.count}",
                                    style: GoogleFonts.getFont(
                                      'Plus Jakarta Sans',
                                      color: const Color(0xFF42526D),
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          MediaQuery.sizeOf(context).width >=
                                                  800
                                              ? 14.0
                                              : 8.0,
                                    ),
                                  ),

                                  // Previous Page Button
                                  TextButton(
                                    onPressed: currentPage > 1
                                        ? () {
                                            setState(() {
                                              currentPage--;
                                              context
                                                  .read<
                                                      OtpSearchDetailsReportingCubit>()
                                                  .otpGetDetailsReporting(
                                                    query: searchQueary,
                                                    type: "OTP",
                                                    pageNo: (currentPage - 1)
                                                        .toString(),
                                                    size:
                                                        itemsPerPage.toString(),
                                                  );
                                            });
                                          }
                                        : null, // Disabled if on the first page
                                    child: const Text('Prev'),
                                  ),

                                  // Display Page Numbers (starting from 1 for user-friendliness)
                                  for (int i = 1;
                                      i <=
                                          (detailsReportingState.data!.count! /
                                                  itemsPerPage)
                                              .ceil();
                                      i++)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: InkWell(
                                        radius: 50,
                                        borderRadius: BorderRadius.circular(50),
                                        onTap: () {
                                          setState(() {
                                            currentPage =
                                                (i); // Adjusting since display starts from 1 but logic from 0
                                            context
                                                .read<
                                                    OtpSearchDetailsReportingCubit>()
                                                .otpGetDetailsReporting(
                                                  query: searchQueary,
                                                  type: "OTP",
                                                  pageNo: (i - 1).toString(),
                                                  size: itemsPerPage.toString(),
                                                );
                                          });
                                        },
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: (currentPage) == i
                                                ? const Color(0xFFDDFFEB)
                                                : Colors.transparent,
                                          ),
                                          child: Text(
                                            '$i',
                                            style: TextStyle(
                                              color: (currentPage) == i
                                                  ? const Color(0xFF0CB653)
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  // Next Page Button
                                  TextButton(
                                    onPressed: (currentPage) <=
                                            (detailsReportingState
                                                            .data!.count! /
                                                        itemsPerPage)
                                                    .ceil() -
                                                1
                                        ? () {
                                            setState(() {
                                              currentPage++;
                                              context
                                                  .read<
                                                      OtpSearchDetailsReportingCubit>()
                                                  .otpGetDetailsReporting(
                                                    query: searchQueary,
                                                    type: "OTP",
                                                    pageNo: (currentPage - 1)
                                                        .toString(),
                                                    size:
                                                        itemsPerPage.toString(),
                                                  );
                                            });
                                          }
                                        : null, // Disabled if on the last page
                                    child: const Text('Next'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ));
          }),
          child:
              BlocBuilder<OtpDetailsReportingCubit, OtpDetailsReportingState>(
                  builder: (context, snapshot) {
            return snapshot.when(
                initial: () => const Center(),
                loading: () => const Center(),
                empty: () => const Center(),
                success: (detailsReportingState) => Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            children: [
                              DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  value: itemsPerPage,
                                  onChanged: (int? newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        itemsPerPage = newValue;
                                        currentPage = 1;
                                        // Reset to first page when changing items per page
                                        // totalPages =
                                        //     (detailsReportingState.data!.count! / itemsPerPage)
                                        //         .ceil();
                                      });
                                      searchQueary = '';
                                      searchController.clear();

                                      context
                                          .read<OtpDetailsReportingCubit>()
                                          .getDetailsReporting(
                                            from: (DateFormat('d/M/yyyy')
                                                .format(_createdFromDate ??
                                                    DateTime.now())),
                                            to: (DateFormat('d/M/yyyy').format(
                                                _deliverdToDate ??
                                                    DateTime.now())),
                                            pageNo:
                                                (currentPage - 1).toString(),
                                            size: itemsPerPage.toString(),
                                          );
                                    }
                                  },
                                  items: [5, 10, 15, 20].map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(
                                        'Lines per page: $value',
                                        style: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          color: const Color(0xFF2861B4),
                                          fontWeight: FontWeight.w600,
                                          fontSize: MediaQuery.sizeOf(context)
                                                      .width >=
                                                  800
                                              ? 14.0
                                              : 8.0,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),

                          //Pegination details
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Text showing current page status
                                  Text(
                                    //  ' ${currentPage} - $itemsPerPage of ${detailsReportingState.data!.count}',

                                    // "${currentPage > 0 ? currentPage : 1} - $itemsPerPage of ${detailsReportingState.data!.count}",
                                    "$currentPage - $itemsPerPage of ${detailsReportingState.data!.count}",
                                    style: GoogleFonts.getFont(
                                      'Plus Jakarta Sans',
                                      color: const Color(0xFF42526D),
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          MediaQuery.sizeOf(context).width >=
                                                  800
                                              ? 14.0
                                              : 8.0,
                                    ),
                                  ),

                                  // Previous Page Button
                                  TextButton(
                                    onPressed: currentPage > 1
                                        ? () {
                                            setState(() {
                                              currentPage--;
                                              context
                                                  .read<
                                                      OtpDetailsReportingCubit>()
                                                  .getDetailsReporting(
                                                    from: (DateFormat(
                                                            'd/M/yyyy')
                                                        .format(
                                                            _createdFromDate ??
                                                                DateTime
                                                                    .now())),
                                                    to: (DateFormat('d/M/yyyy')
                                                        .format(
                                                            _deliverdToDate ??
                                                                DateTime
                                                                    .now())),
                                                    pageNo: (currentPage - 1)
                                                        .toString(),
                                                    size:
                                                        itemsPerPage.toString(),
                                                  );
                                            });
                                          }
                                        : null, // Disabled if on the first page
                                    child: const Text('Prev'),
                                  ),

                                  // Display Page Numbers (starting from 1 for user-friendliness)
                                  for (int i = 1;
                                      i <=
                                          (detailsReportingState.data!.count! /
                                                  itemsPerPage)
                                              .ceil();
                                      i++)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: InkWell(
                                        radius: 50,
                                        borderRadius: BorderRadius.circular(50),
                                        onTap: () {
                                          setState(() {
                                            currentPage =
                                                (i); // Adjusting since display starts from 1 but logic from 0
                                            context
                                                .read<
                                                    OtpDetailsReportingCubit>()
                                                .getDetailsReporting(
                                                  from: (DateFormat('d/M/yyyy')
                                                      .format(
                                                          _createdFromDate ??
                                                              DateTime.now())),
                                                  to: (DateFormat('d/M/yyyy')
                                                      .format(_deliverdToDate ??
                                                          DateTime.now())),
                                                  pageNo: (i - 1).toString(),
                                                  size: itemsPerPage.toString(),
                                                );
                                          });
                                        },
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: (currentPage) == i
                                                ? const Color(0xFFDDFFEB)
                                                : Colors.transparent,
                                          ),
                                          child: Text(
                                            '$i',
                                            style: TextStyle(
                                              color: (currentPage) == i
                                                  ? const Color(0xFF0CB653)
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  // Next Page Button
                                  TextButton(
                                    onPressed: (currentPage) <=
                                            (detailsReportingState
                                                            .data!.count! /
                                                        itemsPerPage)
                                                    .ceil() -
                                                1
                                        ? () {
                                            setState(() {
                                              currentPage++;
                                              context
                                                  .read<
                                                      OtpDetailsReportingCubit>()
                                                  .getDetailsReporting(
                                                    from: (DateFormat(
                                                            'd/M/yyyy')
                                                        .format(
                                                            _createdFromDate ??
                                                                DateTime
                                                                    .now())),
                                                    to: (DateFormat('d/M/yyyy')
                                                        .format(
                                                            _deliverdToDate ??
                                                                DateTime
                                                                    .now())),
                                                    pageNo: (currentPage - 1)
                                                        .toString(),
                                                    size:
                                                        itemsPerPage.toString(),
                                                  );
                                            });
                                          }
                                        : null, // Disabled if on the last page
                                    child: const Text('Next'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                error: (error) => const Text(""));
          }),
        ),
      ],
    );
  }
}

class SMSReports extends StatefulWidget {
  const SMSReports({super.key});

  @override
  State<SMSReports> createState() => _SMSReportsState();
}

class _SMSReportsState extends State<SMSReports> {
  int currentPage = 1;
  int itemsPerPage = 10;
  int totalItems = 0; //detailsReportingState.data!.count
  //int totalPages =2;  //  (detailsReportingState.data!.count! / itemsPerPage).ceil();   // Dynaicly calculating for.  ForLoop of pagination from
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  CalendarFormat calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.enforced;
  DateTime? _createdFromDate;
  DateTime? get createdFromDate => _createdFromDate;

  bool _isSearching = false;

  set createdFromDate(DateTime? value) {
    setState(() {
      _createdFromDate = value;
    });
  }

  DateTime? _deliverdToDate;
  DateTime? get deliverdToDate => _deliverdToDate;
  set deliverdToDate(DateTime? value) {
    setState(() {
      _deliverdToDate = value;
    });
  }

  @override
  void initState() {
    super.initState();
    MixPanelAnalyticsManager()
        .sendEvent("Reports_SMS_User_CTA", "Reports SMS User CTA", null);
  }

  String searchQueary = '';
  int totalCount = 0;
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: 15.0,
          runSpacing: 15.0,
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.start,
          verticalDirection: VerticalDirection.down,
          clipBehavior: Clip.none,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: const TextStyle(fontSize: 14),
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                              color: Color(0xFFB3B9C4), width: 1.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onSubmitted: (value) {
                        searchController.text = value;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            _isSearching = true;
                          });

                          // Trigger the search
                          context
                              .read<SmsSearchDetailsReportingCubit>()
                              .otpGetDetailsReporting(
                                  query: searchController.text,
                                  pageNo: '0',
                                  //size: '10',
                                  size: itemsPerPage.toString(),
                                  type: 'SMS');
                        } else {
                          setState(() {
                            _isSearching = false;
                            searchQueary = '';
                            currentPage = 1;
                          });
                          // Optionally trigger a reset or default fetch
                          MixPanelAnalyticsManager().sendEvent(
                              "Reports_SMS_Search", "Reports SMS Search", null);
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() {
                        _selectedDay = null;
                        _rangeStart = null;
                        _rangeEnd = null;
                        calendarFormat = CalendarFormat.month;
                        _rangeSelectionMode = RangeSelectionMode.enforced;
                        itemsPerPage = 10;
                        currentPage = 1;
                        // currentPage = 0;
                        _isSearching = false;
                        searchQueary = "";
                      });
                      deliverdToDate = DateTime.now();
                      createdFromDate = DateTime.now();
                      _focusedDay = DateTime.now();

                      searchController.clear();
                      context
                          .read<SmsDetailsReportingCubit>()
                          .getDetailsReporting(
                              from: (DateFormat('d/M/yyyy')
                                  .format(DateTime.now())),
                              to: (DateFormat('d/M/yyyy')
                                  .format(DateTime.now())),
                              pageNo: "0",
                              size: "10");
                      MixPanelAnalyticsManager().sendEvent(
                          "Reports_SMS_Reset", "Reports SMS Reset", null);
                    },
                    text: 'Reset',
                    options: FFButtonOptions(
                      height: 44.0,
                      elevation: 0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF2861B4),
                      textStyle: TextStyle(
                        color: AppColors.whiteTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: isDesktop(context) ? 14 : 11,
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
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AbsorbPointer(
                    absorbing: _isSearching,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 0, right: 20),
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
                                    'Reports_SMS_date_range',
                                    'Reports SMS date range',
                                    null);
                                await showAlignedDialog(
                                  context: context,
                                  isGlobal: true,
                                  avoidOverflow: false,
                                  targetAnchor:
                                      const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                  followerAnchor:
                                      const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                  builder: (dialogContext) {
                                    return StatefulBuilder(
                                        builder: (context, stfstate) {
                                      return Material(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
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
                                                                      FontWeight
                                                                          .w500)),
                                                          firstDay: DateTime(
                                                              DateTime.now()
                                                                  .year,
                                                              DateTime.now()
                                                                      .month -
                                                                  3,
                                                              DateTime.now()
                                                                  .day),
                                                          lastDay: DateTime
                                                              .now(),
                                                          focusedDay:
                                                              _focusedDay,
                                                          selectedDayPredicate:
                                                              (day) =>
                                                                  isSameDay(
                                                                      _selectedDay,
                                                                      day),
                                                          rangeStartDay:
                                                              _rangeStart,
                                                          rangeEndDay:
                                                              _rangeEnd,
                                                          calendarFormat:
                                                              calendarFormat,
                                                          rangeSelectionMode:
                                                              _rangeSelectionMode,
                                                          onRangeSelected:
                                                              (start, end,
                                                                  focusedDay) {
                                                            stfstate(
                                                              () {
                                                                _selectedDay =
                                                                    null;
                                                                _focusedDay =
                                                                    focusedDay;
                                                                _rangeStart =
                                                                    start;
                                                                _rangeEnd = end;
                                                                _rangeSelectionMode =
                                                                    _rangeSelectionMode;
                                                              },
                                                            );
                                                          });
                                                    }),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
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
                                                                  _createdFromDate =
                                                                      _rangeStart!;
                                                                  deliverdToDate =
                                                                      _rangeEnd;

                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                } else {}
                                                              });
                                                            },
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Text(
                                                                  "APPLY",
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
                                      color: AppColors.primaryBackground,
                                      borderRadius: BorderRadius.circular(4.0),
                                      border: Border.all(
                                        color: const Color(0xFFB3B9C4),
                                        width: 1.0,
                                      )),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
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
                                              "${_createdFromDate == null ? DateFormat.yMMMd('en').format(DateTime.now()) : DateFormat.yMMMd('en').format(_createdFromDate!)}  To  ${deliverdToDate == null ? DateFormat.yMMMd('en').format(DateTime.now()) : DateFormat.yMMMd('en').format(deliverdToDate!)}",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontWeight: FontWeight.normal,
                                                fontSize:
                                                    MediaQuery.sizeOf(context)
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
                                context
                                    .read<SmsDetailsReportingCubit>()
                                    .getDetailsReporting(
                                      from: (DateFormat('d/M/yyyy').format(
                                          _createdFromDate ?? DateTime.now())),
                                      to: (DateFormat('d/M/yyyy').format(
                                          _deliverdToDate ?? DateTime.now())),
                                      // pageNo: '0',
                                      // size: '10'
                                      pageNo: (currentPage - 1).toString(),
                                      // size: itemsPerPage.toString(),
                                      // pageNo: (currentPage - 1).toString(),
                                      size: itemsPerPage.toString(),
                                    );
                                MixPanelAnalyticsManager().sendEvent(
                                    "Reports_SMS_go_CTA",
                                    "Reports SMS go CTA",
                                    null);
                              },
                              text: 'Go',
                              options: FFButtonOptions(
                                height: 44.0,
                                elevation: 0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF2861B4),
                                textStyle: TextStyle(
                                    color: AppColors.whiteTextColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: isDesktop(context) ? 14 : 11),
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 0, right: 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(30.w, 52), elevation: 0),
                      onPressed: () {
                        downloadFile(
                            LocalStateCache().authToken,
                            LocalStateCache().customerId,
                            _createdFromDate != null
                                ? DateFormat('dd/MM/yyyy')
                                    .format(_createdFromDate!)
                                : DateFormat('dd/MM/yyyy')
                                    .format(DateTime.now()),
                            _deliverdToDate != null
                                ? DateFormat('dd/MM/yyyy')
                                    .format(_deliverdToDate!)
                                : DateFormat('dd/MM/yyyy')
                                    .format(DateTime.now()),
                            'SMS');
                        MixPanelAnalyticsManager().sendEvent(
                            "Reports_SMS_download_report",
                            "Reports SMS download report",
                            null);
                      },
                      child: Text(
                        'Download Report',
                        softWrap: true,
                        style:
                            TextStyle(fontSize: isDesktop(context) ? 16 : 11),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Visibility(
            visible: !_isSearching,
            replacement: BlocConsumer<SmsSearchDetailsReportingCubit,
                    SmsSearchDetailsReportingState>(
                listener: (context, state) {},
                buildWhen: (previous, current) => true,
                builder: (context, stateData) {
                  return stateData.when(
                      initial: () => const Center(),
                      empty: () => Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
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
                                dataTextStyle: GoogleFonts.getFont(
                                  'Plus Jakarta Sans',
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
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
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Submitted',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      // size: ColumnSize.M,
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Delivered',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      //size: ColumnSize.L,
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Mobile Number',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.start,
                                        ),
                                      )),
                                  DataColumn2(
                                      size: ColumnSize.L,
                                      //fixedWidth: 100,
                                      label: Center(
                                        child: Text(
                                          'Sender ID',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.start,
                                        ),
                                      )),
                                  DataColumn2(
                                      fixedWidth: 400,
                                      // MediaQuery.of(context).size.width /
                                      //     3,
                                      label: Center(
                                        child: Text(
                                          'Content',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      size: ColumnSize.M,
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Status',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      label: Center(
                                    child: Text(
                                      'Error code',
                                      maxLines: 2,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                                ],
                                rows: const []),
                          ),
                      loading: () => Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 7),
                            child: const Center(
                                child: CircularProgressIndicator()),
                          ),
                      success: (detailsReportingState) => Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: DataTable2(
                                  // dataRowColor: Colors.black,
                                  columnSpacing: 12,
                                  horizontalMargin: 12,
                                  minWidth: 1175,
                                  smRatio: 0.75,
                                  lmRatio: 1.5,
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
                                          (states) => const Color(0xFF091E42)),
                                  dividerThickness: 0.5,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  columns: const [
                                    DataColumn2(
                                        //size: ColumnSize.M,
                                        fixedWidth: 120,
                                        label: Center(
                                          child: Text(
                                            'Submitted',
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    DataColumn2(
                                        // size: ColumnSize.M,
                                        fixedWidth: 120,
                                        label: Center(
                                          child: Text(
                                            'Delivered',
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    DataColumn2(
                                        //size: ColumnSize.L,
                                        fixedWidth: 120,
                                        label: Center(
                                          child: Text(
                                            'Mobile Number',
                                            maxLines: 2,
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        )),
                                    DataColumn2(
                                        size: ColumnSize.L,
                                        //fixedWidth: 100,
                                        label: Center(
                                          child: Text(
                                            'Sender ID',
                                            maxLines: 2,
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        )),
                                    DataColumn2(
                                        fixedWidth: 455,
                                        // MediaQuery.of(context).size.width /
                                        //     3,
                                        label: Center(
                                          child: Text(
                                            'Content',
                                            maxLines: 2,
                                            softWrap: true,
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    DataColumn2(
                                        size: ColumnSize.M,
                                        fixedWidth: 120,
                                        label: Center(
                                          child: Text(
                                            'Status',
                                            maxLines: 2,
                                            softWrap: true,
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    DataColumn2(
                                        label: Center(
                                      child: Text(
                                        'Error code',
                                        maxLines: 2,
                                        softWrap: true,
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                  ],
                                  rows: List.generate(
                                    detailsReportingState.data!.data!.length,
                                    (index) => DataRow(
                                        color: MaterialStatePropertyAll(
                                            index % 2 == 0
                                                ? AppColors.primaryBackground
                                                : AppColors
                                                    .secondaryBackground),
                                        cells: [
                                          DataCell(Center(
                                            child: Text(
                                              '${DateFormat('d/M').format(detailsReportingState.data!.data![index].createdAt!)} | ${DateFormat('HH:mm').format(detailsReportingState.data!.data![index].createdAt!)}',
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.primaryText),
                                            ),
                                          )),
                                          DataCell(Center(
                                            child: Text(
                                              detailsReportingState
                                                          .data!
                                                          .data![index]
                                                          .deliveredAt ==
                                                      null
                                                  ? "NA"
                                                  : '${DateFormat('d/M').format(detailsReportingState.data!.data![index].deliveredAt!)} | ${DateFormat('HH:mm').format(detailsReportingState.data!.data![index].deliveredAt!)}',
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.primaryText),
                                            ),
                                          )),
                                          DataCell(Center(
                                            child: Text(
                                              detailsReportingState.data!
                                                  .data![index].mobileNumber!,
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  color: AppColors.primaryText),
                                            ),
                                          )),
                                          DataCell(Center(
                                            child: Text(
                                              detailsReportingState
                                                  .data!.data![index].senderId!,
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  color: AppColors.primaryText),
                                            ),
                                          )),
                                          DataCell(Text(
                                            detailsReportingState.data!
                                                .data![index].messageBody!,
                                            textAlign: TextAlign.start,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                color: AppColors.primaryText),
                                          )),
                                          DataCell(
                                            Center(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                  color: detailsReportingState
                                                              .data!
                                                              .data![index]
                                                              .status ==
                                                          "DELIVRD"
                                                      ? const Color(0xFFDDFFEB)
                                                      : const Color(0xFFFCD3D0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Text(
                                                  detailsReportingState.data!
                                                      .data![index].status!
                                                      .toUpperCase(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: detailsReportingState
                                                                .data!
                                                                .data![index]
                                                                .status ==
                                                            "DELIVRD"
                                                        ? const Color(
                                                            0xFF0CB653)
                                                        : const Color(
                                                            0xFFE03227),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(Center(
                                            child: Text(
                                              detailsReportingState.data!
                                                  .data![index].errorCode!,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.primaryText),
                                            ),
                                          )),
                                        ]),
                                  )

                                  // ],

                                  ),
                            ),
                          ),
                      error: (error) => Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 3),
                            child: Center(
                                child: Text(
                              error,
                              style: const TextStyle(color: Colors.black),
                            )),
                          ));
                }),
            child: BlocConsumer<SmsDetailsReportingCubit,
                    SmsDetailsReportingState>(
                listener: (context, state) {
                  state.maybeWhen(
                    success: (detailsReportingEntity) {
                      setState(() {
                        totalCount = detailsReportingEntity.data?.count ?? 0;
                      });
                    },
                    orElse: () {
                      totalCount = 0;
                    },
                  );
                },
                buildWhen: (previous, current) => true,
                builder: (context, stateData) {
                  return stateData.when(
                      initial: () => const Center(),
                      empty: () => Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
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
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Submitted',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      // size: ColumnSize.M,
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Delivered',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      //size: ColumnSize.L,
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Mobile Number',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.start,
                                        ),
                                      )),
                                  DataColumn2(
                                      size: ColumnSize.L,
                                      //fixedWidth: 100,
                                      label: Center(
                                        child: Text(
                                          'Sender ID',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.start,
                                        ),
                                      )),
                                  DataColumn2(
                                      fixedWidth: 300,
                                      // MediaQuery.of(context).size.width /
                                      //     3,
                                      label: Center(
                                        child: Text(
                                          'Content',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      size: ColumnSize.M,
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Status',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      label: Center(
                                    child: Text(
                                      'Error code',
                                      maxLines: 2,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                                ],
                                rows: const []),
                          ),
                      loading: () => Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 7),
                            child: const Center(
                                child: CircularProgressIndicator()),
                          ),
                      success: (detailsReportingState) => Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: DataTable2(
                                // dataRowColor: Colors.black,
                                columnSpacing: 12,
                                horizontalMargin: 12,
                                minWidth: 1175,
                                smRatio: 0.75,
                                lmRatio: 1.5,
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
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Submitted',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      // size: ColumnSize.M,
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Delivered',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      //size: ColumnSize.L,
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Mobile Number',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.start,
                                        ),
                                      )),
                                  DataColumn2(
                                      size: ColumnSize.L,
                                      //fixedWidth: 100,
                                      label: Center(
                                        child: Text(
                                          'Sender ID',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.start,
                                        ),
                                      )),
                                  DataColumn2(
                                      fixedWidth: 455,
                                      // MediaQuery.of(context).size.width /
                                      //     3,
                                      label: Center(
                                        child: Text(
                                          'Content',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      size: ColumnSize.M,
                                      fixedWidth: 120,
                                      label: Center(
                                        child: Text(
                                          'Status',
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  DataColumn2(
                                      label: Center(
                                    child: Text(
                                      'Error code',
                                      maxLines: 2,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                                ],
                                rows: List.generate(
                                  detailsReportingState.data!.data!.length,
                                  (index) => DataRow(
                                      color: MaterialStatePropertyAll(
                                          index % 2 == 0
                                              ? AppColors.primaryBackground
                                              : AppColors.secondaryBackground),
                                      cells: [
                                        DataCell(Center(
                                          child: Text(
                                            '${DateFormat('d/M').format(detailsReportingState.data!.data![index].createdAt!)} | ${DateFormat('HH:mm').format(detailsReportingState.data!.data![index].createdAt!)}',
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: AppColors.primaryText),
                                          ),
                                        )),
                                        DataCell(Center(
                                          child: Text(
                                            detailsReportingState
                                                        .data!
                                                        .data![index]
                                                        .deliveredAt ==
                                                    null
                                                ? "NA"
                                                : '${DateFormat('d/M').format(detailsReportingState.data!.data![index].deliveredAt!)} | ${DateFormat('HH:mm').format(detailsReportingState.data!.data![index].deliveredAt!)}',
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: AppColors.primaryText),
                                          ),
                                        )),
                                        DataCell(Center(
                                          child: Text(
                                            detailsReportingState.data!
                                                .data![index].mobileNumber!,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                color: AppColors.primaryText),
                                          ),
                                        )),
                                        DataCell(Center(
                                          child: Text(
                                            detailsReportingState
                                                .data!.data![index].senderId!,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                color: AppColors.primaryText),
                                          ),
                                        )),
                                        DataCell(Text(
                                          detailsReportingState
                                              .data!.data![index].messageBody!,
                                          textAlign: TextAlign.start,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              color: AppColors.primaryText),
                                        )),
                                        DataCell(
                                          Center(
                                            child: Container(
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                color: detailsReportingState
                                                            .data!
                                                            .data![index]
                                                            .status ==
                                                        "DELIVRD"
                                                    ? const Color(0xFFDDFFEB)
                                                    : const Color(0xFFFCD3D0),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Text(
                                                detailsReportingState
                                                    .data!.data![index].status!
                                                    .toUpperCase(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: detailsReportingState
                                                              .data!
                                                              .data![index]
                                                              .status ==
                                                          "DELIVRD"
                                                      ? const Color(0xFF0CB653)
                                                      : const Color(0xFFE03227),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataCell(Center(
                                          child: Text(
                                            detailsReportingState
                                                .data!.data![index].errorCode!,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: AppColors.primaryText),
                                          ),
                                        )),
                                      ]),
                                )

                                // ],

                                ),
                          ),
                      error: (error) => Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 3),
                            child: Center(
                                child: Text(
                              error,
                              style: const TextStyle(color: Colors.black),
                            )),
                          ));
                }),
          ),
        ),
        // Container(color: Colors.white, child: const Divider()),
        Visibility(
          visible: !_isSearching,
          replacement: BlocBuilder<SmsSearchDetailsReportingCubit,
              SmsSearchDetailsReportingState>(builder: (context, state) {
            return state.when(
                empty: () => const Center(),
                error: (errorMessage) => const Center(),
                loading: () => const Center(),
                initial: () => const Center(),
                success: (detailsReportingState) => Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            children: [
                              DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  value: itemsPerPage,
                                  onChanged: (int? newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        itemsPerPage = newValue;
                                        currentPage = 1;
                                        // Reset to first page when changing items per page
                                        // totalPages =
                                        //     (detailsReportingState.data!.count! / itemsPerPage)
                                        //         .ceil();
                                      });
                                      searchQueary = '';
                                      //  searchController.clear();

                                      context
                                          .read<
                                              SmsSearchDetailsReportingCubit>()
                                          .otpGetDetailsReporting(
                                            query: searchController.text,
                                            type: "SMS",
                                            pageNo:
                                                (currentPage - 1).toString(),
                                            size: itemsPerPage.toString(),
                                          );
                                    }
                                  },
                                  items: [5, 10, 15, 20].map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(
                                        'Lines per page: $value',
                                        style: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          color: const Color(0xFF2861B4),
                                          fontWeight: FontWeight.w600,
                                          fontSize: MediaQuery.sizeOf(context)
                                                      .width >=
                                                  800
                                              ? 14.0
                                              : 8.0,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),

                          //Pegination details
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Text showing current page status
                                  Text(
                                    //  ' ${currentPage} - $itemsPerPage of ${detailsReportingState.data!.count}',
                                    //"${currentPage > 0 ? currentPage : 1} - $itemsPerPage of ${detailsReportingState.data!.count}",
                                    "$currentPage - $itemsPerPage of ${detailsReportingState.data!.count}",
                                    style: GoogleFonts.getFont(
                                      'Plus Jakarta Sans',
                                      color: const Color(0xFF42526D),
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          MediaQuery.sizeOf(context).width >=
                                                  800
                                              ? 14.0
                                              : 8.0,
                                    ),
                                  ),

                                  // Previous Page Button
                                  TextButton(
                                    onPressed: currentPage > 1
                                        ? () {
                                            setState(() {
                                              currentPage--;
                                              context
                                                  .read<
                                                      SmsSearchDetailsReportingCubit>()
                                                  .otpGetDetailsReporting(
                                                    query: searchQueary,
                                                    type: "SMS",
                                                    pageNo: (currentPage - 1)
                                                        .toString(),
                                                    size:
                                                        itemsPerPage.toString(),
                                                  );
                                            });
                                          }
                                        : null, // Disabled if on the first page
                                    child: const Text('Prev'),
                                  ),

                                  // Display Page Numbers (starting from 1 for user-friendliness)
                                  for (int i = 1;
                                      i <=
                                          (detailsReportingState.data!.count! /
                                                  itemsPerPage)
                                              .ceil();
                                      i++)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: InkWell(
                                        radius: 50,
                                        borderRadius: BorderRadius.circular(50),
                                        onTap: () {
                                          setState(() {
                                            currentPage =
                                                (i); // Adjusting since display starts from 1 but logic from 0
                                            context
                                                .read<
                                                    SmsSearchDetailsReportingCubit>()
                                                .otpGetDetailsReporting(
                                                  query: searchQueary,
                                                  type: "SMS",
                                                  pageNo: (i - 1).toString(),
                                                  size: itemsPerPage.toString(),
                                                );
                                          });
                                        },
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: (currentPage) == i
                                                ? const Color(0xFFDDFFEB)
                                                : Colors.transparent,
                                          ),
                                          child: Text(
                                            '$i',
                                            style: TextStyle(
                                              color: (currentPage) == i
                                                  ? const Color(0xFF0CB653)
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  // Next Page Button
                                  TextButton(
                                    onPressed: (currentPage) <=
                                            (detailsReportingState
                                                            .data!.count! /
                                                        itemsPerPage)
                                                    .ceil() -
                                                1
                                        ? () {
                                            setState(() {
                                              currentPage++;
                                              context
                                                  .read<
                                                      SmsSearchDetailsReportingCubit>()
                                                  .otpGetDetailsReporting(
                                                    query: searchQueary,
                                                    type: "OTP",
                                                    pageNo: (currentPage - 1)
                                                        .toString(),
                                                    size:
                                                        itemsPerPage.toString(),
                                                  );
                                            });
                                          }
                                        : null, // Disabled if on the last page
                                    child: const Text('Next'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ));
          }),
          child:
              BlocBuilder<SmsDetailsReportingCubit, SmsDetailsReportingState>(
                  builder: (context, snapshot) {
            return snapshot.when(
                initial: () => const Center(),
                loading: () => const Center(),
                empty: () => const Center(),
                success: (detailsReportingState) => Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            children: [
                              DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  value: itemsPerPage,
                                  onChanged: (int? newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        itemsPerPage = newValue;
                                        currentPage = 1;
                                        // Reset to first page when changing items per page
                                        // totalPages =
                                        //     (detailsReportingState.data!.count! / itemsPerPage)
                                        //         .ceil();
                                      });
                                      searchQueary = '';
                                      searchController.clear();

                                      context
                                          .read<SmsDetailsReportingCubit>()
                                          .getDetailsReporting(
                                            from: (DateFormat('d/M/yyyy')
                                                .format(_createdFromDate ??
                                                    DateTime.now())),
                                            to: (DateFormat('d/M/yyyy').format(
                                                _deliverdToDate ??
                                                    DateTime.now())),
                                            pageNo:
                                                (currentPage - 1).toString(),
                                            size: itemsPerPage.toString(),
                                          );
                                    }
                                  },
                                  items: [5, 10, 15, 20].map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(
                                        'Lines per page: $value',
                                        style: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          color: const Color(0xFF2861B4),
                                          fontWeight: FontWeight.w600,
                                          fontSize: MediaQuery.sizeOf(context)
                                                      .width >=
                                                  800
                                              ? 14.0
                                              : 8.0,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),

                          //Pegination details
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Text showing current page status
                                  Text(
                                    //  ' ${currentPage} - $itemsPerPage of ${detailsReportingState.data!.count}',

                                    // "${currentPage > 0 ? currentPage : 1} - $itemsPerPage of ${detailsReportingState.data!.count}",
                                    "$currentPage - $itemsPerPage of ${detailsReportingState.data!.count}",
                                    style: GoogleFonts.getFont(
                                      'Plus Jakarta Sans',
                                      color: const Color(0xFF42526D),
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          MediaQuery.sizeOf(context).width >=
                                                  800
                                              ? 14.0
                                              : 8.0,
                                    ),
                                  ),

                                  // Previous Page Button
                                  TextButton(
                                    onPressed: currentPage > 1
                                        ? () {
                                            setState(() {
                                              currentPage--;
                                              context
                                                  .read<
                                                      SmsDetailsReportingCubit>()
                                                  .getDetailsReporting(
                                                    from: (DateFormat(
                                                            'd/M/yyyy')
                                                        .format(
                                                            _createdFromDate ??
                                                                DateTime
                                                                    .now())),
                                                    to: (DateFormat('d/M/yyyy')
                                                        .format(
                                                            _deliverdToDate ??
                                                                DateTime
                                                                    .now())),
                                                    pageNo: (currentPage - 1)
                                                        .toString(),
                                                    size:
                                                        itemsPerPage.toString(),
                                                  );
                                            });
                                          }
                                        : null, // Disabled if on the first page
                                    child: const Text('Prev'),
                                  ),

                                  // Display Page Numbers (starting from 1 for user-friendliness)
                                  for (int i = 1;
                                      i <=
                                          (detailsReportingState.data!.count! /
                                                  itemsPerPage)
                                              .ceil();
                                      i++)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: InkWell(
                                        radius: 50,
                                        borderRadius: BorderRadius.circular(50),
                                        onTap: () {
                                          setState(() {
                                            currentPage =
                                                (i); // Adjusting since display starts from 1 but logic from 0
                                            context
                                                .read<
                                                    SmsDetailsReportingCubit>()
                                                .getDetailsReporting(
                                                  from: (DateFormat('d/M/yyyy')
                                                      .format(
                                                          _createdFromDate ??
                                                              DateTime.now())),
                                                  to: (DateFormat('d/M/yyyy')
                                                      .format(_deliverdToDate ??
                                                          DateTime.now())),
                                                  pageNo: (i - 1).toString(),
                                                  size: itemsPerPage.toString(),
                                                );
                                          });
                                        },
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: (currentPage) == i
                                                ? const Color(0xFFDDFFEB)
                                                : Colors.transparent,
                                          ),
                                          child: Text(
                                            '$i',
                                            style: TextStyle(
                                              color: (currentPage) == i
                                                  ? const Color(0xFF0CB653)
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  // Next Page Button
                                  TextButton(
                                    onPressed: (currentPage) <=
                                            (detailsReportingState
                                                            .data!.count! /
                                                        itemsPerPage)
                                                    .ceil() -
                                                1
                                        ? () {
                                            setState(() {
                                              currentPage++;
                                              context
                                                  .read<
                                                      SmsDetailsReportingCubit>()
                                                  .getDetailsReporting(
                                                    from: (DateFormat(
                                                            'd/M/yyyy')
                                                        .format(
                                                            _createdFromDate ??
                                                                DateTime
                                                                    .now())),
                                                    to: (DateFormat('d/M/yyyy')
                                                        .format(
                                                            _deliverdToDate ??
                                                                DateTime
                                                                    .now())),
                                                    pageNo: (currentPage - 1)
                                                        .toString(),
                                                    size:
                                                        itemsPerPage.toString(),
                                                  );
                                            });
                                          }
                                        : null, // Disabled if on the last page
                                    child: const Text('Next'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                error: (error) => const Text(""));
          }),
        ),
      ],
    );
  }
}

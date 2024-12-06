
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:messagecentral/core/global_widgets/custom_button.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:fl_chart/fl_chart.dart';

class MessageNowDashboard extends StatefulWidget {
  const MessageNowDashboard({super.key});

  @override
  State<MessageNowDashboard> createState() => _MessageNowDashboardState();
}

class _MessageNowDashboardState extends State<MessageNowDashboard> {
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
                  child: Text('Dashboard',
                      style: CustomTextStyle.getFont(
                          FlutterFlowTheme.of(context).primaryText,
                          17.0,
                          FontWeight.w700)),
                )),
          ),
          const Divider(color: Color(0xFFDFE2E6), height: 1.0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // if (responsiveVisibility(
                  //   context: context,
                  //   phone: false,
                  // ))
                  Container(
                    constraints: const BoxConstraints(
                        minHeight: 208, minWidth: double.infinity),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: const Color(0xFFDFE2E6))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Overview",
                            style: CustomTextStyle.getFont(
                                FlutterFlowTheme.of(context).primaryText,
                                17.0,
                                FontWeight.w600)),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            Container(
                              width:
                                  245, //MediaQuery.sizeOf(context).width * 0.18,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                border: Border.all(
                                  color: const Color(0xFFDFE2E6),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("SMS Sent Today",
                                      style: CustomTextStyle.getFont(
                                          const Color(0xFF20A4CD),
                                          14.0,
                                          FontWeight.w500)),
                                  Text("16,032",
                                      style: CustomTextStyle.getFont(
                                          const Color(0xFF20A4CD),
                                          34.2,
                                          FontWeight.w700)),
                                ],
                              ),
                            ),
                            Container(
                              width:
                                  245, //MediaQuery.sizeOf(context).width * 0.18,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                border: Border.all(
                                  color: const Color(0xFFDFE2E6),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Delivered Today",
                                      style: CustomTextStyle.getFont(
                                          const Color(0xFF0CB653),
                                          14.0,
                                          FontWeight.w500)),
                                  Text("90%",
                                      style: CustomTextStyle.getFont(
                                          const Color(0xFF0CB653),
                                          34.2,
                                          FontWeight.w700)),
                                ],
                              ),
                            ),
                            Container(
                              width:
                                  245, //MediaQuery.sizeOf(context).width * 0.18,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                border: Border.all(
                                  color: const Color(0xFFDFE2E6),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("SMS Sent Yesterday",
                                      style: CustomTextStyle.getFont(
                                          const Color(0xFF0CB653),
                                          14.0,
                                          FontWeight.w500)),
                                  Text("16,032",
                                      style: CustomTextStyle.getFont(
                                          const Color(0xFF0CB653),
                                          34.2,
                                          FontWeight.w700)),
                                ],
                              ),
                            ),
                            Container(
                              width: 245,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topRight: kIsWeb
                                        ? Radius.circular(8)
                                        : Radius.circular(0),
                                    bottomRight: Radius.circular(8),
                                    bottomLeft: kIsWeb
                                        ? Radius.circular(0)
                                        : Radius.circular(8)),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                border: Border.all(
                                  color: const Color(0xFFDFE2E6),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Delivered Yesterday",
                                      style: CustomTextStyle.getFont(
                                          const Color(0XFF8039F1),
                                          14.0,
                                          FontWeight.w500)),
                                  Text("88%",
                                      style: CustomTextStyle.getFont(
                                          const Color(0XFF8039F1),
                                          34.2,
                                          FontWeight.w700)),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(
                        minHeight: 208, minWidth: double.infinity),
                    margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: const Color(0xFFDFE2E6))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Traffic Summary",
                              style: CustomTextStyle.getFont(
                                  FlutterFlowTheme.of(context).primaryText,
                                  17.0,
                                  FontWeight.w600)),
                          const SizedBox(
                            height: 24,
                          ),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              ChoiceChip(
                                showCheckmark: false,
                                label: const Text("Total Sent (228945)"),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0XFFC6D8F1)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                selectedColor: const Color(0xFFEDF2FA),
                                labelStyle: CustomTextStyle.getFont(
                                    const Color(0XFF4C7CC1),
                                    14.0,
                                    FontWeight.w600),
                                selected: true,
                                onSelected: (value) {},
                              ),
                              ChoiceChip(
                                label: const Text("Delivered 219777 (96%)"),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0XFFDFE2E6)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                labelStyle: CustomTextStyle.getFont(
                                    const Color(0XFF243757),
                                    14.0,
                                    FontWeight.w500),
                                selected: false,
                                onSelected: (value) {},
                              ),
                              ChoiceChip(
                                label: const Text("Submitted 228945"),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xFFDFE2E6)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                labelStyle: CustomTextStyle.getFont(
                                    const Color(0xFF243757),
                                    14.0,
                                    FontWeight.w500),
                                selected: false,
                                onSelected: (value) {},
                              ),
                              ChoiceChip(
                                label: const Text("Rejected 6000 (2.6%)"),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xFFDFE2E6)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                labelStyle: CustomTextStyle.getFont(
                                    const Color(0xFF243757),
                                    14.0,
                                    FontWeight.w500),
                                selected: false,
                                onSelected: (value) {},
                              ),
                              ChoiceChip(
                                label: const Text("Undelivered 2158 (0.01%)"),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xFFDFE2E6)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                labelStyle: CustomTextStyle.getFont(
                                    const Color(0xFF243757),
                                    14.0,
                                    FontWeight.w500),
                                selected: false,
                                onSelected: (value) {},
                              ),
                              ChoiceChip(
                                label: const Text("Other 0 (0%)"),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xFFDFE2E6)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                labelStyle: CustomTextStyle.getFont(
                                    const Color(0xFF243757),
                                    14.0,
                                    FontWeight.w500),
                                selected: false,
                                onSelected: (value) {},
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const LineChartWidget2()
                        ]),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LineChartWidget2 extends StatelessWidget {
  const LineChartWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4,
      child: Column(
        children: [
          Expanded(
            child: LineChart(LineChartData(
                lineTouchData: lineTouchData1,
                gridData: gridData,
                borderData: borderData,
                titlesData: titlesData1,
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                    spots: const [
                      FlSpot(1, 2.8),
                      FlSpot(3, 1.9),
                      FlSpot(6, 3),
                      FlSpot(10, 1.3),
                      FlSpot(13, 2.5),
                    ],
                  ),
                  LineChartBarData(
                    isCurved: true,
                    color: Colors.pink,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                    spots: const [
                      FlSpot(1, 1),
                      FlSpot(3, 4),
                      FlSpot(5, 1.8),
                      FlSpot(7, 5),
                      FlSpot(10, 2),
                      FlSpot(12, 2.2),
                      FlSpot(13, 1.8),
                    ],
                  ),
                  LineChartBarData(
                    isCurved: true,
                    color: Colors.yellow,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                    spots: const [
                      FlSpot(0, 1.3),
                      FlSpot(1, 1),
                      FlSpot(2, 1.8),
                      FlSpot(3, 1.5),
                      FlSpot(4, 2.2),
                      FlSpot(5, 1.8),
                      FlSpot(6, 3),
                    ],
                  ),
                ])),
          ),
          TopSectionWidget(
            legends: [
              Legend(title: 'Delivered', color: const Color(0xFF28BEEC)),
              Legend(
                title: 'Submitted',
                color: const Color(0xFF0CB653), // #28BEEC // #0CB653
              ),
              Legend(
                title: 'Rejected',
                color: const Color(0xFFF28728), // #28BEEC // #0CB653
              ),
              Legend(
                title: 'Undeliverd',
                color: const Color(0xFF8039F1), // #28BEEC // #0CB653
              ),
              Legend(
                title: 'Other',
                color: const Color(0xFFE03227), // #28BEEC // #0CB653
              ),
            ],
            padding:
                const EdgeInsets.only(left: 8, right: 18, top: 24, bottom: 8),
          ),
        ],
      ),
    );
  }

  LineTouchData get lineTouchData1 => const LineTouchData(
        handleBuiltInTouches: true,
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );
  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom:
              BorderSide(color: Colors.deepOrange.withOpacity(0.7), width: 1.5),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 11.2,
        fontStyle: FontStyle.normal,
        color: Color(0xFF7A8699));
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10';
        break;
      case 2:
        text = '20';
        break;
      case 3:
        text = '30';
        break;
      case 4:
        text = '40';
        break;
      case 5:
        text = '50';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 11.2,
        fontStyle: FontStyle.normal,
        color: Color(0xFF7A8699));
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text('1/8', style: style);
        break;
      case 7:
        text = Text('2/8', style: style);
        break;
      case 12:
        text = Text('3/8', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 20,
      child: text,
    );
  }
}

class TopSectionWidget extends StatelessWidget {
  final List<Legend> legends;
  final EdgeInsets padding;

  const TopSectionWidget({
    Key? key,
    required this.legends,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      margin: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...legends
              .map(
                (e) => Row(
                  children: [
                    _LegendWidget(legend: e),
                    const SizedBox(width: 12)
                  ],
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

class _LegendWidget extends StatelessWidget {
  final Legend legend;

  const _LegendWidget({
    Key? key,
    required this.legend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration:
              BoxDecoration(color: legend.color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(legend.title,
            style: CustomTextStyle.getFont(const Color(0xFF243757), 14.0,
                FontWeight.w400) //const TextStyle(color: Color(0xFF243757))

            ),
      ],
    );
  }
}

class Legend {
  final String title;
  final Color color;

  Legend({
    required this.title,
    required this.color,
  });
}

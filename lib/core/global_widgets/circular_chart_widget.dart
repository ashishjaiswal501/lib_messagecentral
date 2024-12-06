import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularChartWidget extends StatefulWidget {
  final List<dynamic>? chartDatalist;
  const CircularChartWidget({super.key, required this.chartDatalist});

  @override
  State<CircularChartWidget> createState() => _CircularChartWidgetState();
}

class _CircularChartWidgetState extends State<CircularChartWidget> {
  List<_SalesData> data = [];
  Future<List<dynamic>> initChart() async {
    List<dynamic>? chartData = [];
    List<Color> colorList = const [
      Color(0xFF0B6531),
      Color(0xFF0E7E3E),
      Color(0xFF39A968)
    ];

    if (widget.chartDatalist != null) {
      chartData = widget.chartDatalist;
      //newlist = widget.list!.sublist(0, 4);
      chartData?.forEach((obj) {
        // var label = obj['countryName'] + ": " + numFormatNo(obj['sent']);
        setState(() {
          data.add(_SalesData(
              obj.sent,
              "${obj.countryName}: ${numFormatNo(obj.sent)}",
              colorList[Random().nextInt(colorList.length)]));
        });
      });
    }
    return data;
  }

  String? numFormatNo(double? num) {
    if (num == null) {
      return "0";
    }
    var formattedNo = NumberFormat.compact().format(num);
    if (formattedNo.isNotEmpty) {
      return formattedNo;
    } else {
      return "0";
    }
  }

  @override
  void initState() {
   
    super.initState();
    initChart();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SfCircularChart(
            legend: const Legend(
                isVisible: true,
                textStyle: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600)),
            backgroundColor: Colors.white,
            palette: const [
          Color(0xFF0B6531),
          Color(0xFF0E7E3E),
          Color(0xFF39A968)
        ],
            series: <CircularSeries>[
          // Renders radial bar chart
          RadialBarSeries<_SalesData, String>(
              dataSource: data,
              xValueMapper: (_SalesData data, _) => data.text,
              yValueMapper: (_SalesData data, _) => data.sales,
              dataLabelMapper: (_SalesData data, _) => data.text,
              dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 11.0,
                      fontWeight: FontWeight.normal)),
              useSeriesColor: true,
              trackOpacity: 0.1,
              //pointColorMapper: (_SalesData data, _) => data.color,
              gap: '5%',
              radius: '90%',
              innerRadius: '40%',
              trackColor: Colors.grey)
        ]));
  }
}

class _SalesData {
  _SalesData(this.sales, this.text, this.color);

  final double sales;
  final String text;
  final Color color;
}

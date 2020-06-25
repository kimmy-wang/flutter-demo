import 'package:flutter/material.dart';

import 'package:flutter_demo/ui/pages/samples/chart/bar_chart/bar_chart_page.dart';
import 'package:flutter_demo/ui/pages/samples/chart/bar_chart/bar_chart_page2.dart';
import 'package:flutter_demo/ui/pages/samples/chart/line_chart/line_chart_page.dart';
import 'package:flutter_demo/ui/pages/samples/chart/line_chart/line_chart_page2.dart';
import 'package:flutter_demo/ui/pages/samples/chart/line_chart/line_chart_page3.dart';
import 'package:flutter_demo/ui/pages/samples/chart/line_chart/line_chart_page4.dart';
import 'package:flutter_demo/ui/pages/samples/chart/pie_chart/pie_chart_page.dart';
import 'package:flutter_demo/ui/pages/samples/chart/scatter_chart/scatter_chart_page.dart';

class Chart extends StatefulWidget {
  const Chart({Key key, this.headerTitle}) : super(key: key);
  final String headerTitle;

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.headerTitle ?? "Chart")
      ),
      body: SafeArea(
        child: PageView(
          children: <Widget>[
            LineChartPage(),
            BarChartPage(),
            BarChartPage2(),
            PieChartPage(),
            LineChartPage2(),
            LineChartPage3(),
            LineChartPage4(),
            ScatterChartPage(),
          ],
        ),
      ),
    );
  }
}
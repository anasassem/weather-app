import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/presentation/resources/responsive.dart';
import 'package:weather_app/provider/provider.dart';

import '../../domain/models/five_day_data.dart';
class MyChart extends StatelessWidget {
  const MyChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return SizedBox(
        width: responsive.responsiveWidth(context, 1.9),
        height: responsive.responsiveWidth(context, .6),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries<FiveDayData, String>>[
              SplineSeries<FiveDayData, String>(
                dataSource: value.fiveDayData,
                xValueMapper: (FiveDayData f, _) =>
                f.dateTime,
                yValueMapper: (FiveDayData f, _) =>
                f.temp,
              ),
            ],
          ),
        ),
      );
      },
    );
  }
}

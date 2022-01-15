import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pccovid/screens/detail_statistic/viewmodels/weekly_statistic_chart_view_model.dart';
import 'package:provider/provider.dart';

class WeeklyStatisticBarChart extends StatefulWidget {
  const WeeklyStatisticBarChart({
    Key? key,
  }) : super(key: key);

  @override
  State<WeeklyStatisticBarChart> createState() =>
      WeeklyStatisticBarChartState();
}

class WeeklyStatisticBarChartState extends State<WeeklyStatisticBarChart> {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<StatisticChartViewModel>(context, listen: true);
    return Container(
      padding: const EdgeInsets.only(top: 16),
      height: 240,
      child: BarChart(
          BarChartData(
              titlesData: FlTitlesData(
                  show: true,
                  rightTitles: SideTitles(showTitles: false),
                  topTitles: SideTitles(showTitles: false),
                  leftTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 32,
                    getTextStyles: (context, value) => const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                    margin: 0,
                  ),
                  bottomTitles: SideTitles(
                      showTitles: true,
                      getTitles: (index) =>
                          viewModel.getBottomTitle(index.toInt()))),
              gridData: FlGridData(show: true, drawVerticalLine: false),
              borderData: FlBorderData(show: false),
              maxY: viewModel.maxYValue,
              barGroups: getBarGroups()),
          swapAnimationDuration: const Duration(microseconds: 150),
          swapAnimationCurve: Curves.linear),
    );
  }

  BarChartGroupData getBarChartGroupData(int index) {
    var viewModel =
        Provider.of<StatisticChartViewModel>(context, listen: false);
    return BarChartGroupData(x: index, barRods: [
      BarChartRodData(
        y: viewModel.getTotalCases(index),
        colors: [Colors.lightBlueAccent, Colors.greenAccent],
        width: 18,
      )
    ]);
  }

  List<BarChartGroupData> getBarGroups() {
    var viewModel =
        Provider.of<StatisticChartViewModel>(context, listen: false);
    List<BarChartGroupData> lists = [];

    for (int i = 0; i < viewModel.numberOfDays; i++) {
      lists.add(getBarChartGroupData(i));
    }

    return lists;
  }
}

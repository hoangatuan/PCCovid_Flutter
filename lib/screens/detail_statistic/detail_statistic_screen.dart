import 'package:flutter/material.dart';
import 'package:pccovid/screens/detail_statistic/components/country_today_statistic.dart';
import 'package:pccovid/screens/detail_statistic/viewmodels/detail_statistic_view_model.dart';
import 'package:pccovid/screens/detail_statistic/viewmodels/weekly_statistic_chart_view_model.dart';
import 'package:provider/provider.dart';

import 'components/weekly_statistic_bar_chart_view.dart';

class StatisticDisplayConfig {
  String title;
  int? value;

  StatisticDisplayConfig(this.title, this.value);
}

class DetailStatisticScreen extends StatefulWidget {
  const DetailStatisticScreen({Key? key}) : super(key: key);

  @override
  State<DetailStatisticScreen> createState() => _DetailStatisticScreenState();
}

class _DetailStatisticScreenState extends State<DetailStatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DetailStatisticViewModel()),
        ChangeNotifierProvider(create: (context) => StatisticChartViewModel())
      ],
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Statistics"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Today statistic",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
                CountryTodayStatistic(),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Daily New Cases",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
                WeeklyStatisticBarChart(),
              ],
            ),
          )),
    );
  }
}

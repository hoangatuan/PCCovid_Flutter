import 'package:flutter/material.dart';
import 'package:pccovid/screens/detail_statistic/components/country_today_statistic.dart';
import 'package:pccovid/screens/detail_statistic/viewmodels/detail_statistic_view_model.dart';
import 'package:pccovid/screens/detail_statistic/viewmodels/weekly_statistic_chart_view_model.dart';
import 'package:provider/provider.dart';

import 'components/weekly_statistic_bar_chart_view.dart';
import 'package:easy_localization/src/public_ext.dart';

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
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("todayStatistic".tr(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
                const CountryTodayStatistic(),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("daily-new-cases".tr(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
                const WeeklyStatisticBarChart(),
              ],
            ),
          )),
    );
  }
}

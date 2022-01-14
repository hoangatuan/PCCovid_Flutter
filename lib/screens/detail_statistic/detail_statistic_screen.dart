import 'package:flutter/material.dart';
import 'package:pccovid/screens/detail_statistic/components/country_today_statistic.dart';
import 'package:pccovid/screens/detail_statistic/viewmodels/detail_statistic_view_model.dart';
import 'package:pccovid/screens/home/components/statistic_view.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider(create: (context) => DetailStatisticViewModel())
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
                          fontSize: 18)),
                ),
                CountryTodayStatistic(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Select a city",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
              ],
            ),
          )),
    );
  }
}

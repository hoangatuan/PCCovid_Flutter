import 'package:flutter/material.dart';
import 'package:pccovid/screens/detail_statistic/viewmodels/detail_statistic_view_model.dart';
import 'package:pccovid/screens/home/components/statistic_view.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class StatisticDisplayConfig {
  String title;
  int? totalValue;
  int? todayValue;

  StatisticDisplayConfig(this.title, this.totalValue, this.todayValue);
}

class CountryTodayStatistic extends StatefulWidget {
  const CountryTodayStatistic({Key? key}) : super(key: key);

  @override
  _CountryTodayStatisticState createState() => _CountryTodayStatisticState();
}

class _CountryTodayStatisticState extends State<CountryTodayStatistic> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.only(top: 20, left: 28),
      height: 176,
      width: size.width - 32,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("VIETNAM SITUATION",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 8),
          Row(children: [
            buildStatisticItem(StatisticType.confirmed),
            const SizedBox(width: 56),
            buildStatisticItem(StatisticType.treated),
          ]),
          const SizedBox(height: 24),
          Row(children: [
            buildStatisticItem(StatisticType.recovered),
            const SizedBox(width: 56),
            buildStatisticItem(StatisticType.deceased),
          ]),
        ],
      ),
    );
  }

  Row buildStatisticItem(StatisticType type) {
    StatisticDisplayConfig config = _getDisplayConfig(type);
    return Row(
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: prepareToDisplay(config.totalValue),
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
          TextSpan(
              text: "\n${config.title}",
              style: const TextStyle(fontSize: 16, color: Colors.grey))
        ])),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getImage(config.todayValue ?? 0),
            const SizedBox(height: 4),
            Text(
              prepareToDisplay(config.todayValue),
              style: const TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }

  String prepareToDisplay(int? cases) {
    if (cases == null) {
      return "_";
    }
    var formatter = NumberFormat('#,###,000');
    int positiveCases = cases.abs();
    return (formatter.format(positiveCases));
  }

  Widget getImage(int todayCases) {
    String imagePath = todayCases >= 0
        ? "assets/icons/ic_arrow_up.png"
        : "assets/icons/ic_arrow_down.png";
    return Image.asset(imagePath, height: 16, width: 16, color: Colors.green);
  }

  StatisticDisplayConfig _getDisplayConfig(StatisticType type) {
    DetailStatisticViewModel _viewModel =
        Provider.of<DetailStatisticViewModel>(context);
    switch (type) {
      case StatisticType.confirmed:
        return StatisticDisplayConfig(
            "Confirmed",
            _viewModel.countryStatistic?.infected,
            _viewModel.countryStatistic?.infectedToday);
      case StatisticType.treated:
        return StatisticDisplayConfig(
            "Treated",
            _viewModel.countryStatistic?.treated,
            _viewModel.countryStatistic?.treatedToday);
      case StatisticType.recovered:
        return StatisticDisplayConfig(
            "Recovered",
            _viewModel.countryStatistic?.recovered,
            _viewModel.countryStatistic?.recoveredToday);
      case StatisticType.deceased:
        return StatisticDisplayConfig(
            "Deaths",
            _viewModel.countryStatistic?.died,
            _viewModel.countryStatistic?.diedToday);
    }
  }
}

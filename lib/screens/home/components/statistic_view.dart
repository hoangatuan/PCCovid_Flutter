import 'package:flutter/material.dart';
import 'package:pccovid/screens/homee/components/statistic_view_model.dart';
import 'package:provider/provider.dart';

enum StatisticType { confirmed, recovered, deceased }

class StatisticDisplayConfig {
  String image;
  String title;
  Color textColor;
  Color backgroundColor;
  int? value;

  StatisticDisplayConfig(
      this.image, this.title, this.textColor, this.backgroundColor, this.value);
}

class StatisticView extends StatefulWidget {
  const StatisticView({Key? key}) : super(key: key);

  @override
  State<StatisticView> createState() => _StatisticViewState();
}

class _StatisticViewState extends State<StatisticView> {
  StatisticViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<StatisticViewModel>(context, listen: false);
    _viewModel?.prepareDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        buildStatisticItem1(StatisticType.confirmed),
        const Spacer(),
        buildStatisticItem1(StatisticType.recovered),
        const Spacer(),
        buildStatisticItem1(StatisticType.deceased),
        const Spacer(),
      ],
    );
  }

  Container buildStatisticItem1(StatisticType type) {
    Size size = MediaQuery.of(context).size;
    StatisticDisplayConfig config = generateDisplayConfig(type);
    String display = generateDisplayText(config.value);

    return Container(
        height: 140,
        width: (size.width - 80) / 3,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            color: config.backgroundColor),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Image.asset(config.image, width: 32, height: 32),
            const SizedBox(height: 20),
            Text(
              display,
              style: TextStyle(
                  color: config.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(height: 4),
            Text(
              config.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  String generateDisplayText(int? value) {
    if (value == null) {
      return "_";
    }

    if (value > 1000000) {
      return "${value ~/ 1000000}M+";
    }

    if (value > 1000) {
      return "${value ~/ 1000}K+";
    }

    return "$value";
  }

  StatisticDisplayConfig generateDisplayConfig(StatisticType type) {
    final viewModel = Provider.of<StatisticViewModel>(context);
    switch (type) {
      case StatisticType.confirmed:
        return StatisticDisplayConfig(
            "assets/homee/add.png",
            "Confirmed",
            const Color(0xFF9F735F),
            const Color(0xFFEECDBE),
            viewModel.confirmed);
      case StatisticType.recovered:
        return StatisticDisplayConfig(
            "assets/homee/heart.png",
            "Recovered",
            const Color(0xFF9F6479),
            const Color(0xFFEBBFCC),
            viewModel.recovered);
      case StatisticType.deceased:
        return StatisticDisplayConfig("assets/homee/remove.png", "Deaths",
            const Color(0xFF9F735F), const Color(0xFFEECDBE), viewModel.deaths);
    }
  }
}

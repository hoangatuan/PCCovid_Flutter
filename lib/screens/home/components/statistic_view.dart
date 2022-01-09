import 'package:flutter/material.dart';
import 'package:pccovid/constants.dart';
import 'package:pccovid/screens/home/components/statistic_view_model.dart';
import 'package:provider/provider.dart';

enum StatisticType { confirmed, active, recovered, deceased }

class StatisticDisplayConfig {
  String title;
  Color textColor;
  int? value;

  StatisticDisplayConfig(this.title, this.textColor, this.value);
}

class StatisticView extends StatefulWidget {
  const StatisticView({Key? key}) : super(key: key);

  @override
  State<StatisticView> createState() => _StatisticViewState();
}

class _StatisticViewState extends State<StatisticView> {
  @override
  void initState() {
    super.initState();
    Provider.of<StatisticViewModel>(context, listen: false)
        .fetchCountryStatisticData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final viewModel = Provider.of<StatisticViewModel>(context);

    return SizedBox(
      height: 282,
      child: GridView.builder(
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 18, right: 18),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              childAspectRatio: (size.width - 56) / 240),
          itemCount: StatisticType.values.length,
          itemBuilder: (context, index) {
            return buildStatisticItem(index, viewModel);
          }),
    );
  }

  Container buildStatisticItem(int index, StatisticViewModel viewModel) {
    StatisticType type = StatisticType.values[index];
    StatisticDisplayConfig config = generateDisplayConfig(type, viewModel);
    String display = config.value != null ? "${config.value}" : "_";

    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: config.textColor.withAlpha(24)),
        child: Stack(
          children: [
            Positioned(
                child: Text(
                  config.title,
                  style: TextStyle(color: config.textColor, fontSize: 17),
                ),
                top: 13,
                left: 15),
            Positioned(
                child: Text(
                  display,
                  style: TextStyle(
                      color: config.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                bottom: 15,
                right: 15)
          ],
        ));
  }

  StatisticDisplayConfig generateDisplayConfig(
      StatisticType type, StatisticViewModel viewModel) {
    switch (type) {
      case StatisticType.confirmed:
        return StatisticDisplayConfig(
            "Confirmed", colorFC1441, viewModel.data?.infected);
      case StatisticType.active:
        return StatisticDisplayConfig(
            "Active", color157FFB, viewModel.data?.treated);
      case StatisticType.recovered:
        return StatisticDisplayConfig(
            "Recovered", color30A64A, viewModel.data?.recovered);
      case StatisticType.deceased:
        return StatisticDisplayConfig(
            "Deceased", color6D757D, viewModel.data?.died);
    }
  }
}

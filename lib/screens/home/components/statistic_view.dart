import 'package:flutter/material.dart';
import 'package:pccovid/constants.dart';

enum StatisticType { confirmed, active, recovered, deceased }

class StatisticDisplayConfig {
  String title;
  Color textColor;

  StatisticDisplayConfig(this.title, this.textColor);
}

class StatisticView extends StatelessWidget {
  const StatisticView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
            return buildStatisticItem(index);
          }),
    );
  }

  Container buildStatisticItem(int index) {
    StatisticType type = StatisticType.values[index];
    StatisticDisplayConfig config = generateDisplayConfig(type);

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
                  "2,373,395",
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

  StatisticDisplayConfig generateDisplayConfig(StatisticType type) {
    switch (type) {
      case StatisticType.confirmed:
        return StatisticDisplayConfig("Confirmed", colorFC1441);
      case StatisticType.active:
        return StatisticDisplayConfig("Active", color157FFB);
      case StatisticType.recovered:
        return StatisticDisplayConfig("Recovered", color30A64A);
      case StatisticType.deceased:
        return StatisticDisplayConfig("Deceased", color6D757D);
    }
  }
}

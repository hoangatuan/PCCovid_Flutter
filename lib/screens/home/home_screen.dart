import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pccovid/constants.dart';
import 'package:pccovid/screens/home/components/statistic_view_model.dart';
import 'package:provider/provider.dart';

import 'components/home_header_view.dart';
import 'components/home_main_segment_control.dart';
import 'components/precautions_guide_view.dart';
import 'components/range_selection_view.dart';
import 'components/statistic_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorE5E5E5,
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => StatisticViewModel())
        ],
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HomeHeaderView(),
              PrecautionsGuideView(onPress: () {}),
              const HomeMainSegment(),
              RangeSlectionView(onChangeRange: (range) {}),
              const StatisticView(),
              const Text("Spread Trends", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

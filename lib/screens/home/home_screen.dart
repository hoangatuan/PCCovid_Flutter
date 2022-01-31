// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:pccovid/screens/detail_statistic/detail_statistic_screen.dart';
import 'package:pccovid/screens/precautions/view/precaution_screen.dart';
import 'package:provider/provider.dart';

import 'components/home_header_view.dart';
import 'components/precautions_guide_view.dart';
import 'components/range_selection_view.dart';
import 'components/statistic_view.dart';
import 'components/statistic_view_model.dart';

import 'package:easy_localization/src/public_ext.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statisticViewModel = StatisticViewModel();

    return Scaffold(
        body: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => statisticViewModel),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeaderView(
                image: "assets/home/Drcorona.svg", title: "stayhome".tr()),
            RangeSlectionView(
              onChangeRange: (range) {
                statisticViewModel.update(range);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: Row(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "lastestUpdate".tr(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    TextSpan(
                        text: "newestUpdate".tr(),
                        style: const TextStyle(color: Colors.black38))
                  ])),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const DetailStatisticScreen()));
                    },
                    child: const Text(
                      'details',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.blue),
                    ).tr(),
                  )
                ],
              ),
            ),
            const StatisticView(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text("more-about-covid",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18))
                    .tr(),
              ),
            ),
            PrecautionsGuideView(onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrecautionScreen()));
            })
          ],
        ),
      ),
    ));
  }
}

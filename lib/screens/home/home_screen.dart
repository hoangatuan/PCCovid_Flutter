import 'package:flutter/material.dart';
import 'package:pccovid/screens/detail_statistic/detail_statistic_screen.dart';
import 'package:provider/provider.dart';

import 'components/home_header_view.dart';
import 'components/precautions_guide_view.dart';
import 'components/range_selection_view.dart';
import 'components/statistic_view.dart';
import 'components/statistic_view_model.dart';

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
            const HomeHeaderView(
                image: "assets/home/Drcorona.svg",
                title: "All you needed \nis stay at home."),
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
                      text: const TextSpan(children: [
                    TextSpan(
                        text: "Covid-19 Lastest Update\n",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    TextSpan(
                        text: "Newest update Jan 10",
                        style: TextStyle(color: Colors.black38))
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
                      'Details',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
            const StatisticView(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("More about Covid-19",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
            ),
            PrecautionsGuideView(onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailStatisticScreen()));
            })
          ],
        ),
      ),
    ));
  }
}

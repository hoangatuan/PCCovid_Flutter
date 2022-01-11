import 'package:flutter/material.dart';
import 'package:pccovid/screens/home/components/range_selection_view.dart';
import 'package:pccovid/screens/home/components/statistic_view.dart';
import 'package:pccovid/screens/home/components/statistic_view_model.dart';
import 'package:provider/provider.dart';

import 'components/home_header_view.dart';

class HomeeScreen extends StatelessWidget {
  const HomeeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StatisticViewModel())
      ],
      child: Column(
        children: [
          const HomeHeaderView(),
          RangeSlectionView(
            onChangeRange: (range) {},
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
                const Text(
                  'Details',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.blue),
                )
              ],
            ),
          ),
          const StatisticView(),
        ],
      ),
    ));
  }
}

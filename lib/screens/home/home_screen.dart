import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pccovid/constants.dart';

import 'components/home_header_view.dart';
import 'components/precautions_guide_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorE5E5E5,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeaderView(),
            PrecautionsGuideView(onPress: () {}),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class HomeMainSegment extends StatefulWidget {
  const HomeMainSegment({Key? key}) : super(key: key);

  @override
  _HomeMainSegmentState createState() => _HomeMainSegmentState();
}

class _HomeMainSegmentState extends State<HomeMainSegment> {
  int value = 0;
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("Tracker"),
    1: Text("Symptoms")
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      onValueChanged: (int? index) {
        setState(() {
          value = index!;
        });
      },
      children: myTabs,
      groupValue: value,
      backgroundColor: colorF49E6F.withAlpha(100),
    );
  }
}

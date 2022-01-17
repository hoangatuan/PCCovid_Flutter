import 'package:flutter/material.dart';
import 'package:pccovid/screens/base/tab_bar_view.dart';
import 'package:pccovid/services/shared_pref_service.dart';
import 'components/guide_bottom_view.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [
              Image.asset(
                "assets/illustration.png",
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: GuideBottomView(
                    onPress: () {
                      SharePreferenceService.setValue(
                          SharePreferenceKey.didReadGuideLine, true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomTabBarView()));
                    },
                  ))
            ],
          )),
    );
  }
}

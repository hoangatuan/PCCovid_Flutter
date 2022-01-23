import 'package:flutter/material.dart';
import 'package:pccovid/screens/base/tab_bar_view.dart';
import 'package:pccovid/screens/guide/guide_screen.dart';
import 'package:pccovid/services/shared_pref_service.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goToMainScreen(context);

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/icons/shield.png",
          width: 120,
          height: 120,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Future<Widget> getHomeScreen() async {
    bool didReadGuideLine = await SharePreferenceService.getValue<bool>(
            SharePreferenceKey.didReadGuideLine) ??
        false;
    if (didReadGuideLine) {
      return const CustomTabBarView();
    }

    return const GuideScreen();
  }

  void goToMainScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    Widget mainScreen = await getHomeScreen();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => mainScreen));
  }
}

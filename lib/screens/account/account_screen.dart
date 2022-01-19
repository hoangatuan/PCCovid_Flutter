import 'package:flutter/material.dart';
import 'package:pccovid/helpers/constants.dart';
import 'package:pccovid/screens/account/view_model/account_view_model.dart';
import 'package:pccovid/screens/guide/guide_screen.dart';
import 'package:pccovid/screens/places_history/view/places_history_screen.dart';
import 'package:pccovid/screens/places_history/viewmodel/place_history_viewmodel.dart';
import 'package:pccovid/screens/webview/in_app_webview_screen.dart';
import 'package:pccovid/services/shared_pref_service.dart';
import 'package:provider/provider.dart';

enum UtilityType { introduce, language, place, logout }

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final AccountViewModel viewModel = AccountViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildHeaderView(),
          SizedBox(
            height: 200,
            child: ListView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // disable scrolling
                padding: const EdgeInsets.all(0),
                itemCount: viewModel.numberOfItems,
                itemBuilder: (context, index) {
                  return cellForItemAtIndex(index);
                }),
          )
        ],
      ),
    );
  }

  Container buildHeaderView() {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFF3383CD), Color(0xFF11249F)])),
    );
  }

  Widget cellForItemAtIndex(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 50,
      child: GestureDetector(
        onTap: () => didSelectItemAtIndex(index),
        child: Stack(children: [
          Center(
            child: Row(children: [
              Image.asset(viewModel.icons[index], height: 24),
              const SizedBox(width: 16),
              Text(viewModel.title[index],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500))
            ]),
          ),
          if (index != viewModel.numberOfItems - 1)
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(height: 1, color: Colors.black))
        ]),
      ),
    );
  }

  void didSelectItemAtIndex(int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const InAppWebView(
                      url: Constants.introduceUrl,
                      title: "Introduce",
                    )));
        break;
      case 1:
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PlacesHistoryScreen()));
        break;
      default:
        SharePreferenceService.setValue(
            SharePreferenceKey.didReadGuideLine, false);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const GuideScreen()));
    }
  }
}

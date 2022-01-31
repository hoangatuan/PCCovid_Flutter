import 'package:flutter/material.dart';
import 'package:pccovid/screens/home/components/home_header_view.dart';
import 'package:pccovid/screens/precautions/prevention.dart';
import 'package:pccovid/screens/precautions/view/prevent_card.dart';
import 'package:pccovid/screens/precautions/view/symtomp_card.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:pccovid/screens/precautions/view_model/precaution_view_model.dart';
import 'package:pccovid/screens/webview/in_app_webview_screen.dart';

class PrecautionScreen extends StatelessWidget {
  PrecautionScreen({Key? key}) : super(key: key);
  PrecautionViewModel viewModel = PrecautionViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeHeaderView(
            image: "assets/home/coronadr.svg",
            title: "get_to_know_about_covid".tr()),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: const Text("symtomps",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18))
              .tr(),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: generateListSymtomps(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
          child: Text("prevention".tr(),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
        ),
        SizedBox(
          height: PreventCard.height * viewModel.preventions.length,
          child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: viewModel.preventions.length,
              itemBuilder: (context, index) {
                Prevention prevention = viewModel.preventions[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InAppWebView(
                                title: prevention.title, url: prevention.url)));
                  },
                  child: PreventCard(precaution: prevention),
                );
              }),
        )
      ],
    )));
  }

  List<Widget> generateListSymtomps() {
    return viewModel.symtomps
        .map((symptomp) =>
            SymtompCard(image: symptomp.image, symtomp: symptomp.symtomp))
        .toList();
  }
}

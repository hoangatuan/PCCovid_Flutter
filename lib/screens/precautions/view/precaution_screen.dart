import 'package:flutter/material.dart';
import 'package:pccovid/screens/home/components/home_header_view.dart';
import 'package:pccovid/screens/precautions/view/prevent_card.dart';
import 'package:pccovid/screens/precautions/view/symtomp_card.dart';
import 'package:easy_localization/src/public_ext.dart';

class PrecautionScreen extends StatelessWidget {
  const PrecautionScreen({Key? key}) : super(key: key);

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
            children: [
              SymtompCard(
                  image: "assets/precautions/headache.png",
                  symtomp: "headache".tr()),
              SymtompCard(
                  image: "assets/precautions/caugh.png", symtomp: "caugh".tr()),
              SymtompCard(
                  image: "assets/precautions/fever.png", symtomp: "fever".tr())
            ],
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
        PreventCard(
            image: "assets/precautions/wear_mask.png",
            title: "wear_face_mask".tr(),
            prevention: "weak_mask_prevention".tr()),
        PreventCard(
            image: "assets/precautions/wash_hands.png",
            title: "wash_hands".tr(),
            prevention: "wash_hands_prevention".tr())
      ],
    )));
  }
}

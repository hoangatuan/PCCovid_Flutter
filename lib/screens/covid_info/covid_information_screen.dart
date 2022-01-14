import 'package:flutter/material.dart';
import 'package:pccovid/screens/home/components/home_header_view.dart';

class CovidInformationScreen extends StatelessWidget {
  const CovidInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HomeHeaderView(
                image: "assets/home/coronadr.svg",
                title: "Get to know \nAbout Covid-19.")
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pccovid/screens/webview/in_app_webview_screen.dart';

import '../prevention.dart';

class PreventCard extends StatelessWidget {
  static double height = 176;
  Prevention precaution;

  PreventCard({Key? key, required this.precaution}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 20),
      height: 156,
      child: Stack(
        children: [
          Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 24,
                        color: Colors.grey)
                  ])),
          Image.asset(precaution.image),
          Positioned(
              left: 130,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(precaution.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(precaution.prevention,
                        style: const TextStyle(fontSize: 12)),
                    Center(
                        child: Image.asset("assets/icons/next.png",
                            width: 10, height: 10))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

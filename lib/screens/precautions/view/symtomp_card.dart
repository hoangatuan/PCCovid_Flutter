import 'package:flutter/material.dart';

class SymtompCard extends StatelessWidget {
  String image;
  String symtomp;

  SymtompCard({Key? key, required this.image, required this.symtomp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: 100,
        child: Column(
          children: [
            Image.asset(image, height: 90),
            Text(symtomp, style: const TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10), blurRadius: 12, color: Colors.grey)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16))));
  }
}

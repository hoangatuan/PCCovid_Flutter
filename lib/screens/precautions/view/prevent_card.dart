import 'package:flutter/material.dart';

class PreventCard extends StatelessWidget {
  String image;
  String title;
  String prevention;

  PreventCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.prevention})
      : super(key: key);

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
          Image.asset(image),
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
                    Text(title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(prevention, style: const TextStyle(fontSize: 12))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

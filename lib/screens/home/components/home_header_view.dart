import 'package:flutter/material.dart';
import '../../../constants.dart';

class HomeHeaderView extends StatelessWidget {
  const HomeHeaderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width,
        height: 110,
        padding: const EdgeInsets.fromLTRB(18, 52, 18, 18),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/ava.jpg"),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                print("AAA");
              },
              child: Container(
                padding: const EdgeInsets.all(2),
                width: 66,
                decoration: BoxDecoration(
                    color: colorCBC1DB,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/flags/india.png"),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      size: 14,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

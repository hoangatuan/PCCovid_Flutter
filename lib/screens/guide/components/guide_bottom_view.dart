import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class GuideBottomView extends StatelessWidget {
  const GuideBottomView({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: 224,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("be-aware", style: TextStyle(fontSize: 28)).tr(),
            const SizedBox(height: 4),
            const Text("stayHealthy", style: TextStyle(fontSize: 28)).tr(),
            const SizedBox(height: 20),
            const Text(
              "welcomeText",
              style: TextStyle(fontSize: 16),
            ).tr(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "getStarted",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ).tr(),
                const SizedBox(width: 16),
                GestureDetector(
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/ic_forward.png"),
                              fit: BoxFit.cover), // button text
                        )),
                    onTap: onPress)
              ],
            )
          ],
        ),
      ),
    );
  }
}

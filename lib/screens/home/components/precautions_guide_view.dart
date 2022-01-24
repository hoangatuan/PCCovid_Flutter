import 'package:flutter/material.dart';
import '../../../helpers/constants.dart';
import 'package:easy_localization/src/public_ext.dart';

class PrecautionsGuideView extends StatelessWidget {
  const PrecautionsGuideView({Key? key, required this.onPress})
      : super(key: key);

  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 164,
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 22),
      child: Stack(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                  color: colorCFE3FC,
                  borderRadius: const BorderRadius.all(Radius.circular(30)))),
          Positioned(
            top: 0,
            bottom: 0,
            left: 12,
            right: 30,
            child: Row(
              children: [
                Image.asset("assets/home/doctor.png"),
                const SizedBox(width: 16),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 36),
                    Text("safety-tips".tr(),
                        style: TextStyle(color: color142237, fontSize: 15)),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: onPress,
                      splashColor: Colors.yellow,
                      child: Container(
                          width: 41,
                          height: 24,
                          decoration: BoxDecoration(
                              color: color9156EC,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Image.asset("assets/icons/ic_arrow.png")),
                    )
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

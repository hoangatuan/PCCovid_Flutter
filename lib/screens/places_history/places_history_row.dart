import 'package:flutter/material.dart';

class PlacesHistoryRow extends StatelessWidget {
  const PlacesHistoryRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              child: Stack(
                children: [
                  Center(
                      child: SizedBox(
                    width: 2,
                    child: ListView.builder(itemBuilder: (context, index) {
                      return Container(
                          width: 2,
                          height: 12,
                          alignment: Alignment.topCenter,
                          child: Container(
                              color: Colors.grey,
                              alignment: Alignment.topLeft,
                              height: 6));
                    }),
                  )),
                  Center(
                      child: Image.asset("assets/icons/pin.png",
                          width: 24, height: 24))
                ],
              ),
            ),
            const SizedBox(width: 0),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("10/01/2022",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Container(
                        height: 56,
                        decoration: const BoxDecoration(
                            color: Color(0xFFE5E5E5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Stack(children: const [
                          Positioned(
                              child: Text("\u{2022} 13:19"),
                              left: 12,
                              top: 12,
                              right: 8),
                          Positioned(
                              child: Text("Toa nha Peak view"),
                              left: 12,
                              bottom: 8,
                              right: 8)
                        ]))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

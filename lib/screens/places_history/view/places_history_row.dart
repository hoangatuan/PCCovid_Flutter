import 'package:flutter/material.dart';
import 'package:pccovid/screens/places_history/viewmodel/place_viewmodel.dart';

class PlacesHistoryRow extends StatelessWidget {
  const PlacesHistoryRow({Key? key, required this.viewModel}) : super(key: key);

  final PlaceViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          children: [
            buildDashlineView(),
            const SizedBox(width: 0),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(viewModel.displayDate,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Container(
                        height: 56,
                        decoration: const BoxDecoration(
                            color: Color(0xFFE5E5E5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Stack(children: [
                          Positioned(
                              child: Text(viewModel.displayTime),
                              left: 12,
                              top: 12,
                              right: 8),
                          Positioned(
                              child: Text(viewModel.location),
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

  SizedBox buildDashlineView() {
    return SizedBox(
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
              child: Image.asset("assets/icons/pin.png", width: 24, height: 24))
        ],
      ),
    );
  }
}

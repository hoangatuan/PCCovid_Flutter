import 'package:flutter/material.dart';
import 'package:pccovid/screens/places_history/places_history_row.dart';

class PlacesHistoryScreen extends StatelessWidget {
  const PlacesHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places History'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(4, 12, 4, 0),
        child: ListView.builder(
            itemCount: 3,
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return const PlacesHistoryRow();
            }),
      ),
    );
  }
}

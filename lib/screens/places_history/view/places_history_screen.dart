import 'package:flutter/material.dart';
import 'package:pccovid/screens/places_history/view/places_history_row.dart';
import 'package:pccovid/screens/places_history/viewmodel/place_history_viewmodel.dart';
import 'package:pccovid/screens/places_history/viewmodel/place_viewmodel.dart';

class PlacesHistoryScreen extends StatefulWidget {
  const PlacesHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PlacesHistoryScreen> createState() => _PlacesHistoryScreenState();
}

class _PlacesHistoryScreenState extends State<PlacesHistoryScreen> {
  IPlaceHistoryViewModel viewModel = PlaceHistoryViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Places History'),
        ),
        body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (viewModel.places.isEmpty) {
                  return const Center(
                      child: Text(
                    "You haven't gone anywhere. \nPlease scan QR place to check in!",
                    textAlign: TextAlign.center,
                  ));
                }

                return Padding(
                  padding: const EdgeInsets.fromLTRB(4, 12, 4, 0),
                  child: ListView.builder(
                      itemCount: viewModel.places.length,
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (context, index) {
                        return PlacesHistoryRow(
                            viewModel: PlaceViewModel(viewModel.places[index]));
                      }),
                );
              }

              return Container();
            },
            future: viewModel.fetchListPlaces()));
  }
}

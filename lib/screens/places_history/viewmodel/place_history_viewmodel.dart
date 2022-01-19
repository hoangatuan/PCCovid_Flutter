import 'package:pccovid/models/place.dart';
import 'package:pccovid/services/places_service.dart';

abstract class IPlaceHistoryViewModel {
  late List<Place> places;

  Future<void> fetchListPlaces();
}

class PlaceHistoryViewModel implements IPlaceHistoryViewModel {
  @override
  List<Place> places = [];

  @override
  Future<void> fetchListPlaces() async {
    places = await PlacesDatabase.instaces.getAllPlaces();
  }
}

class MockPlaceHistoryViewModel implements IPlaceHistoryViewModel {
  @override
  List<Place> places = [
    Place(location: "Peak View", date: DateTime.now()),
    Place(location: "Peak View", date: DateTime.now()),
    Place(location: "Peak View", date: DateTime.now())
  ];

  @override
  Future<void> fetchListPlaces() async {}
}

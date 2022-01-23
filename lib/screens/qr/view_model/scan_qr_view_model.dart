import 'package:pccovid/models/place.dart';
import 'package:pccovid/services/places_service.dart';

class ScanQRViewModel {
  Future<bool> savePlace(String location) async {
    Place place = Place(location: location, date: DateTime.now());
    return await PlacesDatabase.instaces.create(place);
  }
}

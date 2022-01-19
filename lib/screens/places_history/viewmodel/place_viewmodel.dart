import 'package:pccovid/models/place.dart';

class PlaceViewModel {
  final Place _place;

  PlaceViewModel(this._place);

  String get displayTime =>
      "\u{2022} ${_place.date.hour}:${_place.date.minute}";

  String get displayDate =>
      "${_place.date.day}-${_place.date.month}-${_place.date.year}";

  String get location => _place.location;
}

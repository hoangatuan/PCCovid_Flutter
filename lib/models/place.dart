const String tablePlaces = 'places';

class PlaceFields {
  static const List<String> values = [id, date, location];

  static const String id = "_id";
  static const String date = "date";
  static const String location = "location";
}

class Place {
  final int? id;
  DateTime date;
  String location;

  Place({this.id, required this.date, required this.location});

  Map<String, Object?> toJson() => {
        PlaceFields.id: id,
        PlaceFields.location: location,
        PlaceFields.date: date.toIso8601String()
      };

  static Place fromJson(Map<String, Object?> json) {
    return Place(
        id: json[PlaceFields.id] as int?,
        date: DateTime.parse(json[PlaceFields.date] as String),
        location: json[PlaceFields.location] as String);
  }
}

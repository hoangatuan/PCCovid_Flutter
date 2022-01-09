import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  String name;
  int death;
  int treating;
  int cases;
  int recovered;
  int casesToday;

  Location(this.name, this.death, this.treating, this.cases, this.recovered,
      this.casesToday);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$LocationFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$LocationToJson`.
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

import 'package:pccovid/models/daily_statistic.dart';
import 'package:pccovid/models/location.dart';

import 'package:json_annotation/json_annotation.dart';

/// This allows the `Location` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'country_statistic.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class CountryStatistic {
  int infected;
  int recovered;
  int treated;
  int died;
  int infectedToday;
  int recoveredToday;
  int treatedToday;
  int diedToday;
  List<DailyStatistic> overview;
  List<Location> locations;

  CountryStatistic(
      this.infected,
      this.recovered,
      this.treated,
      this.died,
      this.infectedToday,
      this.recoveredToday,
      this.treatedToday,
      this.diedToday,
      this.overview,
      this.locations);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$LocationFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory CountryStatistic.fromJson(Map<String, dynamic> json) =>
      _$CountryStatisticFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$CountryStatisticToJson`.
  Map<String, dynamic> toJson() => _$CountryStatisticToJson(this);
}

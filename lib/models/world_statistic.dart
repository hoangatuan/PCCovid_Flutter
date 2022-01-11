import 'package:json_annotation/json_annotation.dart';

part 'world_statistic.g.dart';

@JsonSerializable()
class WorldStatistic {
  @JsonKey(name: "TotalConfirmed")
  int confirmed;

  @JsonKey(name: "TotalDeaths")
  int deaths;

  @JsonKey(name: "TotalRecovered")
  int recovered;

  WorldStatistic(this.confirmed, this.deaths, this.recovered);

  factory WorldStatistic.fromJson(Map<String, dynamic> json) =>
      _$WorldStatisticFromJson(json);

  Map<String, dynamic> toJson() => _$WorldStatisticToJson(this);
}

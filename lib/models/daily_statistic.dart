import 'package:json_annotation/json_annotation.dart';

part 'daily_statistic.g.dart';

@JsonSerializable()
class DailyStatistic {
  String date;
  int death;
  int treating;
  int cases;
  int recovered;
  int avgCases7day;
  int avgRecovered7day;
  int avgDeath7day;

  DailyStatistic(
      this.date,
      this.death,
      this.treating,
      this.cases,
      this.recovered,
      this.avgCases7day,
      this.avgRecovered7day,
      this.avgDeath7day);

  factory DailyStatistic.fromJson(Map<String, dynamic> json) =>
      _$DailyStatisticFromJson(json);

  Map<String, dynamic> toJson() => _$DailyStatisticToJson(this);
}

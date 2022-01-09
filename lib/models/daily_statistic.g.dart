// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_statistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyStatistic _$DailyStatisticFromJson(Map<String, dynamic> json) {
  return DailyStatistic(
    json['date'] as String,
    json['death'] as int,
    json['treating'] as int,
    json['cases'] as int,
    json['recovered'] as int,
    json['avgCases7day'] as int,
    json['avgRecovered7day'] as int,
    json['avgDeath7day'] as int,
  );
}

Map<String, dynamic> _$DailyStatisticToJson(DailyStatistic instance) =>
    <String, dynamic>{
      'date': instance.date,
      'death': instance.death,
      'treating': instance.treating,
      'cases': instance.cases,
      'recovered': instance.recovered,
      'avgCases7day': instance.avgCases7day,
      'avgRecovered7day': instance.avgRecovered7day,
      'avgDeath7day': instance.avgDeath7day,
    };

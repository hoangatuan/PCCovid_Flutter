// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'world_statistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorldStatistic _$WorldStatisticFromJson(Map<String, dynamic> json) {
  return WorldStatistic(
    json['TotalConfirmed'] as int,
    json['TotalDeaths'] as int,
    json['TotalRecovered'] as int,
  );
}

Map<String, dynamic> _$WorldStatisticToJson(WorldStatistic instance) =>
    <String, dynamic>{
      'TotalConfirmed': instance.confirmed,
      'TotalDeaths': instance.deaths,
      'TotalRecovered': instance.recovered,
    };

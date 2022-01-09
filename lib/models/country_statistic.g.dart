// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_statistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryStatistic _$CountryStatisticFromJson(Map<String, dynamic> json) {
  return CountryStatistic(
    json['infected'] as int,
    json['recovered'] as int,
    json['treated'] as int,
    json['died'] as int,
    json['infectedToday'] as int,
    json['recoveredToday'] as int,
    json['treatedToday'] as int,
    json['diedToday'] as int,
    (json['overview'] as List<dynamic>)
        .map((e) => DailyStatistic.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['locations'] as List<dynamic>)
        .map((e) => Location.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CountryStatisticToJson(CountryStatistic instance) =>
    <String, dynamic>{
      'infected': instance.infected,
      'recovered': instance.recovered,
      'treated': instance.treated,
      'died': instance.died,
      'infectedToday': instance.infectedToday,
      'recoveredToday': instance.recoveredToday,
      'treatedToday': instance.treatedToday,
      'diedToday': instance.diedToday,
      'overview': instance.overview,
      'locations': instance.locations,
    };

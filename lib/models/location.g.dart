// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    json['name'] as String,
    json['death'] as int,
    json['treating'] as int,
    json['cases'] as int,
    json['recovered'] as int,
    json['casesToday'] as int,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'death': instance.death,
      'treating': instance.treating,
      'cases': instance.cases,
      'recovered': instance.recovered,
      'casesToday': instance.casesToday,
    };

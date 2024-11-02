// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_database_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      base: Base.fromJson(json['base'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'base': instance.base,
    };

Base _$BaseFromJson(Map<String, dynamic> json) => Base(
      hp: (json['HP'] as num).toInt(),
      attack: (json['Attack'] as num).toInt(),
      defense: (json['Defense'] as num).toInt(),
      spAttack: (json['Sp. Attack'] as num).toInt(),
      spDefense: (json['Sp. Defense'] as num).toInt(),
      speed: (json['Speed'] as num).toInt(),
    );

Map<String, dynamic> _$BaseToJson(Base instance) => <String, dynamic>{
      'HP': instance.hp,
      'Attack': instance.attack,
      'Defense': instance.defense,
      'Sp. Attack': instance.spAttack,
      'Sp. Defense': instance.spDefense,
      'Speed': instance.speed,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      english: json['english'] as String,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'english': instance.english,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_database_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      id: (json['id'] as num).toInt(),
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
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
      hp: (json['hp'] as num).toInt(),
      attack: (json['attack'] as num).toInt(),
      defense: (json['defense'] as num).toInt(),
      spAttack: (json['spAttack'] as num).toInt(),
      spDefense: (json['spDefense'] as num).toInt(),
      speed: (json['speed'] as num).toInt(),
    );

Map<String, dynamic> _$BaseToJson(Base instance) => <String, dynamic>{
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'spAttack': instance.spAttack,
      'spDefense': instance.spDefense,
      'speed': instance.speed,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      english: json['english'] as String,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'english': instance.english,
    };

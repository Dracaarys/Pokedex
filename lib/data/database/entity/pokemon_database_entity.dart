
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'pokemon_database_entity.g.dart';


List<Pokemon> pokemonFromJson(String str) =>
    List<Pokemon>.from(json.decode(str).map((x) => Pokemon.fromJson(x)));

String pokemonToJson(List<Pokemon> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class Pokemon {
  @JsonKey(name: PokemonDatabaseContract.idColumn)
  final int  id;
  @JsonKey(name: PokemonDatabaseContract.nameColumn)
  final Name name;
  @JsonKey(name: PokemonDatabaseContract.typeColumn)
  final List<String> type;
  @JsonKey(name: PokemonDatabaseContract.baseColumn)
  final Base base;

  Pokemon({
    required this.id,
    required this.name,
    required this.type,
    required this.base,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

// Modelo Base para estatísticas de batalha do Pokemon
@JsonSerializable()
class Base {
  final int hp;
  final int attack;
  final int defense;
  final int spAttack;
  final int spDefense;
  final int speed;

  Base({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.spAttack,
    required this.spDefense,
    required this.speed,
  });

  factory Base.fromJson(Map<String, dynamic> json) => _$BaseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseToJson(this);
}

// Modelo Name para os nomes em diferentes idiomas
@JsonSerializable()
class Name {
  final String english;

  Name({
    required this.english,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
  Map<String, dynamic> toJson() => _$NameToJson(this);
}

// Definindo as colunas do banco de dados para a tabela Pokemon
abstract class PokemonDatabaseContract {
  static const String pokemonTable = "pokemon";
  static const String idColumn = "id";
  static const String nameColumn = "name";
  static const String typeColumn = "type";
  static const String baseColumn = "base";
}


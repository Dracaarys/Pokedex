import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';

part 'http_paged_result.g.dart'; // Certifique-se de gerar este arquivo

@JsonSerializable()
class HttpPagedResult {
  int first;
  int? prev;
  int? next;
  int last;
  int pages;
  int items;
  List<PokeEntity> data;

  HttpPagedResult({
    required this.first,
    this.prev,
    this.next,
    required this.last,
    required this.pages,
    required this.items,
    required this.data,
  });

  factory HttpPagedResult.fromJson(Map<String, dynamic> json) => _$HttpPagedResultFromJson(json);

  Map<String, dynamic> toJson() => _$HttpPagedResultToJson(this);
}

@JsonSerializable()
class PokeEntity {
  dynamic id;
  String name; // Mude o tipo de Name para String
  List<String> type;
  Base base;

  PokeEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.base,
  });

  factory PokeEntity.fromJson(Map<String, dynamic> json) {
    return PokeEntity(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()), // Garantir que seja um int
      name: json['name']['english'] as String, // Extrair o nome em inglês diretamente
      type: List<String>.from(json['type'].map((x) => x.toString())), // Convertendo para String
      base: Base.fromJson(json['base']),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": {"english": name}, // Se você precisar retornar para o formato original
    "type": List<dynamic>.from(type.map((x) => x)),
    "base": base.toJson(),
  };

  @override
  String toString() {
    return 'PokeEntity{id: $id, name: $name, type: $type}'; // Alterado para usar name diretamente
  }
}
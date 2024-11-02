import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';

part 'http_paged_result.g.dart'; // Certifique-se de gerar este arquivo

@JsonSerializable()
class HttpPagedResult {
  int first;
  dynamic prev;
  int next;
  int last;
  int pages;
  int items;
  List<PokeEntity> data;

  HttpPagedResult({
    required this.first,
    required this.prev,
    required this.next,
    required this.last,
    required this.pages,
    required this.items,
    required this.data,
  });

  factory HttpPagedResult.fromJson(Map<String, dynamic> json) => _$HttpPagedResultFromJson(json);

  Map<String, dynamic> toJson() => {
    "first": first,
    "prev": prev,
    "next": next,
    "last": last,
    "pages": pages,
    "items": items,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

@JsonSerializable()
class PokeEntity {
  int id;
  Name name;
  List<String> type;
  Base base;

  PokeEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.base,
  });

  factory PokeEntity.fromJson(Map<String, dynamic> json) => _$PokeEntityFromJson(json);

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name.toJson(),
    "type": List<dynamic>.from(type.map((x) => x)),
    "base": base.toJson(),
  };

  @override
  String toString() {
    return 'PokeEntity{id: $id, name: ${name.english}, type: $type}';
  }
}



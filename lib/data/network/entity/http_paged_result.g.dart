// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_paged_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpPagedResult _$HttpPagedResultFromJson(Map<String, dynamic> json) =>
    HttpPagedResult(
      first: (json['first'] as num).toInt(),
      prev: json['prev'],
      next: (json['next'] as num).toInt(),
      last: (json['last'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      items: (json['items'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => PokeEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HttpPagedResultToJson(HttpPagedResult instance) =>
    <String, dynamic>{
      'first': instance.first,
      'prev': instance.prev,
      'next': instance.next,
      'last': instance.last,
      'pages': instance.pages,
      'items': instance.items,
      'data': instance.data,
    };

PokeEntity _$PokeEntityFromJson(Map<String, dynamic> json) => PokeEntity(
      id: (json['id'] as num).toInt(),
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      base: Base.fromJson(json['base'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokeEntityToJson(PokeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'base': instance.base,
    };

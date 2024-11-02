import 'package:freezed_annotation/freezed_annotation.dart';

part 'poke.freezed.dart';

@freezed
class Poke with _$Poke {
  const factory Poke({
    required int id,
    required Name name,
    required List<String> type,
    required Base base,
  }) = _Poke;
}

@freezed
class Base with _$Base {
  const factory Base({
    required int hp,
    required int attack,
    required int defense,
    required int spAttack,
    required int spDefense,
    required int speed,
  }) = _Base;
}

@freezed
class Name with _$Name {
  const factory Name({
    required String english,
  }) = _Name;
}

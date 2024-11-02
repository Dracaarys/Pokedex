// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poke.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Poke {
  int get id => throw _privateConstructorUsedError;
  Name get name => throw _privateConstructorUsedError;
  List<String> get type => throw _privateConstructorUsedError;
  Base get base => throw _privateConstructorUsedError;

  /// Create a copy of Poke
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokeCopyWith<Poke> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeCopyWith<$Res> {
  factory $PokeCopyWith(Poke value, $Res Function(Poke) then) =
      _$PokeCopyWithImpl<$Res, Poke>;
  @useResult
  $Res call({int id, Name name, List<String> type, Base base});

  $NameCopyWith<$Res> get name;
  $BaseCopyWith<$Res> get base;
}

/// @nodoc
class _$PokeCopyWithImpl<$Res, $Val extends Poke>
    implements $PokeCopyWith<$Res> {
  _$PokeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Poke
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? base = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<String>,
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Base,
    ) as $Val);
  }

  /// Create a copy of Poke
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NameCopyWith<$Res> get name {
    return $NameCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  /// Create a copy of Poke
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaseCopyWith<$Res> get base {
    return $BaseCopyWith<$Res>(_value.base, (value) {
      return _then(_value.copyWith(base: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokeImplCopyWith<$Res> implements $PokeCopyWith<$Res> {
  factory _$$PokeImplCopyWith(
          _$PokeImpl value, $Res Function(_$PokeImpl) then) =
      __$$PokeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Name name, List<String> type, Base base});

  @override
  $NameCopyWith<$Res> get name;
  @override
  $BaseCopyWith<$Res> get base;
}

/// @nodoc
class __$$PokeImplCopyWithImpl<$Res>
    extends _$PokeCopyWithImpl<$Res, _$PokeImpl>
    implements _$$PokeImplCopyWith<$Res> {
  __$$PokeImplCopyWithImpl(_$PokeImpl _value, $Res Function(_$PokeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Poke
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? base = null,
  }) {
    return _then(_$PokeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      type: null == type
          ? _value._type
          : type // ignore: cast_nullable_to_non_nullable
              as List<String>,
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Base,
    ));
  }
}

/// @nodoc

class _$PokeImpl implements _Poke {
  const _$PokeImpl(
      {required this.id,
      required this.name,
      required final List<String> type,
      required this.base})
      : _type = type;

  @override
  final int id;
  @override
  final Name name;
  final List<String> _type;
  @override
  List<String> get type {
    if (_type is EqualUnmodifiableListView) return _type;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_type);
  }

  @override
  final Base base;

  @override
  String toString() {
    return 'Poke(id: $id, name: $name, type: $type, base: $base)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._type, _type) &&
            (identical(other.base, base) || other.base == base));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_type), base);

  /// Create a copy of Poke
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokeImplCopyWith<_$PokeImpl> get copyWith =>
      __$$PokeImplCopyWithImpl<_$PokeImpl>(this, _$identity);
}

abstract class _Poke implements Poke {
  const factory _Poke(
      {required final int id,
      required final Name name,
      required final List<String> type,
      required final Base base}) = _$PokeImpl;

  @override
  int get id;
  @override
  Name get name;
  @override
  List<String> get type;
  @override
  Base get base;

  /// Create a copy of Poke
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokeImplCopyWith<_$PokeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Base {
  int get hp => throw _privateConstructorUsedError;
  int get attack => throw _privateConstructorUsedError;
  int get defense => throw _privateConstructorUsedError;
  int get spAttack => throw _privateConstructorUsedError;
  int get spDefense => throw _privateConstructorUsedError;
  int get speed => throw _privateConstructorUsedError;

  /// Create a copy of Base
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseCopyWith<Base> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseCopyWith<$Res> {
  factory $BaseCopyWith(Base value, $Res Function(Base) then) =
      _$BaseCopyWithImpl<$Res, Base>;
  @useResult
  $Res call(
      {int hp,
      int attack,
      int defense,
      int spAttack,
      int spDefense,
      int speed});
}

/// @nodoc
class _$BaseCopyWithImpl<$Res, $Val extends Base>
    implements $BaseCopyWith<$Res> {
  _$BaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Base
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hp = null,
    Object? attack = null,
    Object? defense = null,
    Object? spAttack = null,
    Object? spDefense = null,
    Object? speed = null,
  }) {
    return _then(_value.copyWith(
      hp: null == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
      attack: null == attack
          ? _value.attack
          : attack // ignore: cast_nullable_to_non_nullable
              as int,
      defense: null == defense
          ? _value.defense
          : defense // ignore: cast_nullable_to_non_nullable
              as int,
      spAttack: null == spAttack
          ? _value.spAttack
          : spAttack // ignore: cast_nullable_to_non_nullable
              as int,
      spDefense: null == spDefense
          ? _value.spDefense
          : spDefense // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseImplCopyWith<$Res> implements $BaseCopyWith<$Res> {
  factory _$$BaseImplCopyWith(
          _$BaseImpl value, $Res Function(_$BaseImpl) then) =
      __$$BaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int hp,
      int attack,
      int defense,
      int spAttack,
      int spDefense,
      int speed});
}

/// @nodoc
class __$$BaseImplCopyWithImpl<$Res>
    extends _$BaseCopyWithImpl<$Res, _$BaseImpl>
    implements _$$BaseImplCopyWith<$Res> {
  __$$BaseImplCopyWithImpl(_$BaseImpl _value, $Res Function(_$BaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Base
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hp = null,
    Object? attack = null,
    Object? defense = null,
    Object? spAttack = null,
    Object? spDefense = null,
    Object? speed = null,
  }) {
    return _then(_$BaseImpl(
      hp: null == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
      attack: null == attack
          ? _value.attack
          : attack // ignore: cast_nullable_to_non_nullable
              as int,
      defense: null == defense
          ? _value.defense
          : defense // ignore: cast_nullable_to_non_nullable
              as int,
      spAttack: null == spAttack
          ? _value.spAttack
          : spAttack // ignore: cast_nullable_to_non_nullable
              as int,
      spDefense: null == spDefense
          ? _value.spDefense
          : spDefense // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BaseImpl implements _Base {
  const _$BaseImpl(
      {required this.hp,
      required this.attack,
      required this.defense,
      required this.spAttack,
      required this.spDefense,
      required this.speed});

  @override
  final int hp;
  @override
  final int attack;
  @override
  final int defense;
  @override
  final int spAttack;
  @override
  final int spDefense;
  @override
  final int speed;

  @override
  String toString() {
    return 'Base(hp: $hp, attack: $attack, defense: $defense, spAttack: $spAttack, spDefense: $spDefense, speed: $speed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseImpl &&
            (identical(other.hp, hp) || other.hp == hp) &&
            (identical(other.attack, attack) || other.attack == attack) &&
            (identical(other.defense, defense) || other.defense == defense) &&
            (identical(other.spAttack, spAttack) ||
                other.spAttack == spAttack) &&
            (identical(other.spDefense, spDefense) ||
                other.spDefense == spDefense) &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, hp, attack, defense, spAttack, spDefense, speed);

  /// Create a copy of Base
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseImplCopyWith<_$BaseImpl> get copyWith =>
      __$$BaseImplCopyWithImpl<_$BaseImpl>(this, _$identity);
}

abstract class _Base implements Base {
  const factory _Base(
      {required final int hp,
      required final int attack,
      required final int defense,
      required final int spAttack,
      required final int spDefense,
      required final int speed}) = _$BaseImpl;

  @override
  int get hp;
  @override
  int get attack;
  @override
  int get defense;
  @override
  int get spAttack;
  @override
  int get spDefense;
  @override
  int get speed;

  /// Create a copy of Base
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseImplCopyWith<_$BaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Name {
  String get english => throw _privateConstructorUsedError;

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NameCopyWith<Name> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameCopyWith<$Res> {
  factory $NameCopyWith(Name value, $Res Function(Name) then) =
      _$NameCopyWithImpl<$Res, Name>;
  @useResult
  $Res call({String english});
}

/// @nodoc
class _$NameCopyWithImpl<$Res, $Val extends Name>
    implements $NameCopyWith<$Res> {
  _$NameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? english = null,
  }) {
    return _then(_value.copyWith(
      english: null == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NameImplCopyWith<$Res> implements $NameCopyWith<$Res> {
  factory _$$NameImplCopyWith(
          _$NameImpl value, $Res Function(_$NameImpl) then) =
      __$$NameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String english});
}

/// @nodoc
class __$$NameImplCopyWithImpl<$Res>
    extends _$NameCopyWithImpl<$Res, _$NameImpl>
    implements _$$NameImplCopyWith<$Res> {
  __$$NameImplCopyWithImpl(_$NameImpl _value, $Res Function(_$NameImpl) _then)
      : super(_value, _then);

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? english = null,
  }) {
    return _then(_$NameImpl(
      english: null == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NameImpl implements _Name {
  const _$NameImpl({required this.english});

  @override
  final String english;

  @override
  String toString() {
    return 'Name(english: $english)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameImpl &&
            (identical(other.english, english) || other.english == english));
  }

  @override
  int get hashCode => Object.hash(runtimeType, english);

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NameImplCopyWith<_$NameImpl> get copyWith =>
      __$$NameImplCopyWithImpl<_$NameImpl>(this, _$identity);
}

abstract class _Name implements Name {
  const factory _Name({required final String english}) = _$NameImpl;

  @override
  String get english;

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NameImplCopyWith<_$NameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

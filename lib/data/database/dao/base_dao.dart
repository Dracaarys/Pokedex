import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseDao {
  static const databaseVersion = 1;
  static const _databaseName = 'pokemon_database.db';

  Database? _database;

  @protected
  Future<Database> getDb() async {
    _database ??= await _getDatabase();
    return _database!;
  }

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) async {
        final batch = db.batch();
        _createPokemonTableV1(batch);
        await batch.commit();
      },
      version: databaseVersion,
    );
  }
    //criação do banco
  void _createPokemonTableV1(Batch batch) {
    batch.execute(
      '''
      CREATE TABLE ${PokemonDatabaseContract.pokemonTable}(
        ${PokemonDatabaseContract.idColumn} INTEGER PRIMARY KEY,
        ${PokemonDatabaseContract.nameColumn} TEXT NOT NULL,
        ${PokemonDatabaseContract.typeColumn} TEXT NOT NULL,
        ${PokemonDatabaseContract.baseColumn} TEXT NOT NULL
      );
      ''',
    );
  }
}

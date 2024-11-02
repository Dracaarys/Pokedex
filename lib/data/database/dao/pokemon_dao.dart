import 'package:pokedex/data/database/dao/base_dao.dart'; // Certifique-se de que o caminho está correto
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:sqflite/sqflite.dart';

class PokeDao extends BaseDao {
  Future<List<Pokemon>> selectAll({
    int? limit,
    int? offset,
  }) async {
    final Database db = await getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      PokemonDatabaseContract.pokemonTable,
      limit: limit,
      offset: offset,
      orderBy: '${PokemonDatabaseContract.idColumn} ASC',
    );

    return List.generate(maps.length, (i) {
      return Pokemon.fromJson(maps[i]); // Use Pokemon aqui, não PokeDatabaseEntity
    });
  }

  Future<void> insert(Pokemon entity) async {
    final Database db = await getDb();
    await db.insert(PokemonDatabaseContract.pokemonTable, entity.toJson());
  }

  Future<void> insertAll(List<Pokemon> entities) async {
    final Database db = await getDb();
    await db.transaction((transaction) async {
      for (final entity in entities) {
        await transaction.insert(PokemonDatabaseContract.pokemonTable, entity.toJson());
      }
    });
  }

  Future<void> deleteAll() async {
    final Database db = await getDb();
    await db.delete(PokemonDatabaseContract.pokemonTable);
  }
}

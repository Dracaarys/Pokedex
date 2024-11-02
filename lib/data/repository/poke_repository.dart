

import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';


abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemon({ required int page, required int limit});
}
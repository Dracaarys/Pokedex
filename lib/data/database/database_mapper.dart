import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:pokedex/domain/exception/mapper_exception.dart';



class DatabaseMapper {

  // Mapeia uma PokemonDatabaseEntity para um Pokemon
  Pokemon toPokemon(Pokemon entity) {
    try {
      return Pokemon(
        id: entity.id,
        name: entity.name, // Presumindo que o nome já esteja na forma correta (Name)
        type: entity.type,
        base: entity.base,
      );
    } catch (e) {
      throw MapperException<Pokemon, Pokemon>(e.toString());
    }
  }

  // Mapeia uma lista de PokemonDatabaseEntity para uma lista de Pokemon
  List<Pokemon> toPokemons(List<Pokemon> entities) {
    final List<Pokemon> pokemons = [];
    for (var pokemonEntity in entities) {
      pokemons.add(toPokemon(pokemonEntity));
    }
    return pokemons;
  }

  // Mapeia um Pokemon para uma PokemonDatabaseEntity
  Pokemon toPokemonDatabaseEntity(Pokemon pokemon) {
    try {
      return Pokemon(
        id: pokemon.id,
        name: pokemon.name, // Presumindo que o nome já esteja na forma correta (Name)
        type: pokemon.type,
        base: pokemon.base,
      );
    } catch (e) {
      throw MapperException<Pokemon, Pokemon>(e.toString());
    }
  }

  // Mapeia uma lista de Pokemon para uma lista de PokemonDatabaseEntity
  List<Pokemon> toPokemonDatabaseEntities(List<Pokemon> pokemons) {
    final List<Pokemon> pokemonDatabaseEntities = [];
    for (var p in pokemons) {
      pokemonDatabaseEntities.add(toPokemonDatabaseEntity(p));
    }
    return pokemonDatabaseEntities;
  }
}

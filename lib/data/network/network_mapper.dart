import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';

import 'entity/http_paged_result.dart';
import 'package:pokedex/domain/exception/mapper_exception.dart';

class NetworkMapper {

  // Mapeia uma PokeEntity para um Pokemon
  Pokemon toPokemon(PokeEntity entity) {
    try {
      return Pokemon(
        id: entity.id,
        name: entity.name,
        type: entity.type,
        base: entity.base,
      );
    } catch (e) {
      throw MapperException<PokeEntity, Pokemon>(e.toString());
    }
  }

  // Mapeia uma lista de PokeEntity para uma lista de Pokemon
  List<Pokemon> toPokemons(List<PokeEntity> entities) {
    final List<Pokemon> pokemons = [];
    for (var pokemonEntity in entities) {
      pokemons.add(toPokemon(pokemonEntity));
    }
    return pokemons;
  }

  // Mapeia um Pokemon para uma PokeEntity
  PokeEntity toPokeEntity(Pokemon pokemon) {
    try {
      return PokeEntity(
        id: pokemon.id,
        name: pokemon.name, // Presumindo que o nome já esteja na forma correta (Name)
        type: pokemon.type,
        base: pokemon.base,
      );
    } catch (e) {
      throw MapperException<Pokemon, PokeEntity>(e.toString());
    }
  }

  // Mapeia uma lista de Pokemon para uma lista de PokeEntity
  List<PokeEntity> toPokeEntities(List<Pokemon> pokemons) {
    final List<PokeEntity> pokeEntities = [];
    for (var pokemon in pokemons) {
      pokeEntities.add(toPokeEntity(pokemon));
    }
    return pokeEntities;
  }
}

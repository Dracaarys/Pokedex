import 'package:pokedex/data/database/dao/pokemon_dao.dart';
import 'package:pokedex/data/database/database_mapper.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:pokedex/data/network/client/api_poke.dart';
import 'package:pokedex/data/network/entity/http_paged_result.dart';
import 'package:pokedex/data/network/network_mapper.dart';
import 'package:pokedex/data/repository/poke_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;
  final PokeDao pokemonDao;
  final DatabaseMapper databaseMapper;

  PokemonRepositoryImpl({
    required this.pokemonDao,
    required this.databaseMapper,
    required this.apiClient,
    required this.networkMapper,
  });

  Future<List<Pokemon>> getPokemon({ required int page, required int limit }) async {
    // Tentar carregar a partir do banco de dados
    final dbEntities = await pokemonDao.selectAll(limit: 5, offset: (page * limit) - limit);

    // Se os dados já existem, carregar esses dados.
    if (dbEntities.isNotEmpty) {
      return databaseMapper.toPokemons(dbEntities); // Ajuste conforme a função de mapeamento para Pokémon
    }

    // Caso contrário, buscar pela API remota
    final networkEntity = await apiClient.getPokemons(page: page, limit: limit); // Altere para o método de Pokémon
    final pokemons = networkMapper.toPokemons(networkEntity.cast<PokeEntity>()); // Ajuste conforme a função de mapeamento para Pokémon

    // E salvar os dados no banco local para cache
    pokemonDao.insertAll(databaseMapper.toPokemonDatabaseEntities(pokemons)); // Altere para o método de inserção de Pokémon

    return pokemons;
  }
}
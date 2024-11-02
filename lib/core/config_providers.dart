

import 'package:provider/provider.dart';
import 'package:pokedex/data/database/dao/pokemon_dao.dart';
import 'package:pokedex/data/database/database_mapper.dart';
import 'package:pokedex/data/network/client/api_poke.dart';
import 'package:pokedex/data/network/network_mapper.dart';
import 'package:pokedex/data/repository/poke_repository_Impl.dart';
import 'package:provider/single_child_widget.dart';

class ConfigureProviders {
  final List<SingleChildWidget> providers;

  ConfigureProviders({required this.providers});

  static Future<ConfigureProviders> createDependencyTree() async {

    final api_client = ApiClient(baseUrl: "http://10.0.2.2:3000");
    final network_mapper = NetworkMapper();
    final database_mapper = DatabaseMapper();
    final pokemon_dao = PokeDao();

    final pokemon_repository = PokemonRepositoryImpl(
        apiClient: api_client,
        networkMapper: network_mapper,
        databaseMapper: database_mapper,
        pokemonDao: pokemon_dao
    );

    return ConfigureProviders(providers: [
      Provider<ApiClient>.value(value: api_client),
      Provider<NetworkMapper>.value(value: network_mapper),
      Provider<DatabaseMapper>.value(value: database_mapper),
      Provider<PokeDao>.value(value: pokemon_dao),
      Provider<PokemonRepositoryImpl>.value(value: pokemon_repository),
    ]);
  }
}


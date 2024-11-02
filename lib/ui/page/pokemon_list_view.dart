import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:pokedex/data/repository/poke_repository_Impl.dart';
import 'package:pokedex/ui/widget/pokemoncard.dart';
import 'package:provider/provider.dart';

class PokemonsListPage extends StatefulWidget {
  const PokemonsListPage({super.key});

  @override
  State<PokemonsListPage> createState() => _PokeListPageState();
}

class _PokeListPageState extends State<PokemonsListPage> {
  late final PokemonRepositoryImpl pokeRepo;
  late final PagingController<int, Pokemon> _pagingController =
  PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    pokeRepo = Provider.of<PokemonRepositoryImpl>(context, listen: false);
    _pagingController.addPageRequestListener(
          (pageKey) async {
        try {
          // Buscando pokémons da página solicitada
          final poke = await pokeRepo.getPokemon(page: pageKey, limit: 10);
          // Adiciona a nova página ao controlador
          _pagingController.appendPage(poke, pageKey + 1);
        } catch (e, stackTrace) {
          print('Erro: $e');
          print('Stack Trace: $stackTrace');
          _pagingController.error = e;
        }
      },
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokémons"),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: PagedListView<int, Pokemon>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Pokemon>(
          itemBuilder: (context, pokemon, index) => PokemonCard(pokemon: pokemon),
          // Aqui você pode adicionar outras opções como loading e erro, se necessário
        ),
      ),
    );
  }
}

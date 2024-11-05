import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:pokedex/data/repository/poke_repository_Impl.dart';
import 'package:pokedex/ui/widget/pokemoncard.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/data/database/dao/daily_service.dart';

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
          final poke = await pokeRepo.getPokemon(page: pageKey, limit: 10);
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
      body: Stack(
        children: [

          Opacity(
            opacity: 0.7, // Ajuste a opacidade para o efeito de marca d'água
            child: Image.asset(
              'images/poke.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          PagedListView<int, Pokemon>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Pokemon>(
              itemBuilder: (context, pokemon, index) => PokemonCard(
                pokemon: pokemon,
                onRelease: () async {
                  bool success = await DailyPokemonService().releasePokemon(pokemon);
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${pokemon.name} solto com sucesso!"),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Erro ao soltar ${pokemon.name}."),
                    ));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

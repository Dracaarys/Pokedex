import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokedex/data/database/dao/daily_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

    // Adiciona carregamento inicial do cache ao iniciar a tela
    _loadCachedPokemons();

    // Listener para carregar páginas adicionais e fazer cache
    _pagingController.addPageRequestListener((pageKey) => _loadPage(pageKey));
  }

  // Função para carregar o cache dos Pokémon ao iniciar
  Future<void> _loadCachedPokemons() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getStringList('cached_pokemon_list') ?? [];

    if (cachedData.isNotEmpty) {
      final cachedPokemons = cachedData.map((json) {
        return Pokemon.fromJson(jsonDecode(json));
      }).toList();

      // Atualiza o PagingController com os Pokémon cacheados
      _pagingController.itemList = cachedPokemons;

      print("Pokémons carregados do cache: ${cachedPokemons.length}");
    }
  }

  // Função para cachear novos Pokémon carregados
  Future<void> _cachePokemonPage(List<Pokemon> newPokemons) async {
    final prefs = await SharedPreferences.getInstance();

    // Carrega o cache atual e adiciona os novos Pokémon sem duplicados
    final cachedData = prefs.getStringList('cached_pokemon_list') ?? [];
    final newCachedData = cachedData.toList();

    newPokemons.forEach((pokemon) {
      if (!newCachedData.any((json) {
        final cachedPokemon = Pokemon.fromJson(jsonDecode(json));
        return cachedPokemon.id == pokemon.id;
      })) {
        newCachedData.add(jsonEncode(pokemon.toJson()));
      }
    });

    // Salva o cache atualizado
    await prefs.setStringList('cached_pokemon_list', newCachedData);
    print("Cache atualizado com ${newCachedData.length} Pokémon.");
  }

  //  carregar cada página e fazer cache
  Future<void> _loadPage(int pageKey) async {
    try {
      final pokemons = await pokeRepo.getPokemon(page: pageKey, limit: 10);

      // Carrega a página e cacheia os Pokémon
      _pagingController.appendPage(pokemons, pageKey + 1);
      await _cachePokemonPage(pokemons);
    } catch (e) {
      print('Erro ao carregar a página: $e');
      _pagingController.error = e;
    }
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
            opacity: 0.7,
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

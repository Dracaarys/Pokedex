import 'package:flutter/material.dart';
import 'package:pokedex/data/database/dao/daily_service.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:pokedex/ui/widget/pokemoncard.dart';
import 'package:pokedex/ui/page/PokemonDetailPage.dart';

class CapturedPokemonsPage extends StatefulWidget {
  const CapturedPokemonsPage({Key? key}) : super(key: key);

  @override
  _CapturedPokemonsPageState createState() => _CapturedPokemonsPageState();
}

class _CapturedPokemonsPageState extends State<CapturedPokemonsPage> {
  late final DailyPokemonService dailyPokemonService;
  late Future<List<Pokemon>> capturedPokemonsFuture;

  @override
  void initState() {
    super.initState();
    dailyPokemonService = DailyPokemonService();
    capturedPokemonsFuture = dailyPokemonService.getCapturedPokemon();
  }

  Future<void> _refreshCapturedPokemons() async {
    // Atualiza a lista de Pokémon capturados
    setState(() {
      capturedPokemonsFuture = dailyPokemonService.getCapturedPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokémons Capturados"),
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: capturedPokemonsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro ao carregar Pokémons capturados"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Nenhum Pokémon capturado"));
          } else {
            final capturedPokemons = snapshot.data!;
            return ListView.builder(
              itemCount: capturedPokemons.length,
              itemBuilder: (context, index) {
                final pokemon = capturedPokemons[index];
                return PokemonCard(
                  pokemon: pokemon,
                  onRelease: () async {
                    // Quando o Pokémon for solto, atualiza a lista
                    final success = await dailyPokemonService.releasePokemon(pokemon);
                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("${pokemon.name} solto com sucesso!"),
                      ));
                      // Atualiza a lista de Pokémon capturados
                      _refreshCapturedPokemons();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Erro ao soltar ${pokemon.name}."),
                      ));
                    }
                  },
                ); // Use seu card existente
              },
            );
          }
        },
      ),
    );
  }
}

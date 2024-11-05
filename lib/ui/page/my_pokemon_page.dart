import 'package:flutter/material.dart';
import 'package:pokedex/data/database/dao/daily_service.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:pokedex/ui/widget/pokemoncard.dart';

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
                return PokemonCard(pokemon: pokemon); // Use seu card existente
              },
            );
          }
        },
      ),
    );
  }
}

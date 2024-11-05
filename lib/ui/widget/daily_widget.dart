import 'package:flutter/material.dart';
import 'package:pokedex/data/database/dao/daily_service.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';

class DailyPokemonWidget extends StatefulWidget {
  final List<Pokemon> pokemonList;

  const DailyPokemonWidget({Key? key, required this.pokemonList}) : super(key: key);

  @override
  _DailyPokemonWidgetState createState() => _DailyPokemonWidgetState();
}

class _DailyPokemonWidgetState extends State<DailyPokemonWidget> {
  late final DailyPokemonService dailyPokemonService;
  Pokemon? dailyPokemon;

  @override
  void initState() {
    super.initState();
    dailyPokemonService = DailyPokemonService();
    _loadDailyPokemon();
  }

  Future<void> _loadDailyPokemon() async {
    final pokemon = await dailyPokemonService.getDailyPokemon(widget.pokemonList);
    setState(() {
      dailyPokemon = pokemon;
    });
  }

  Future<void> _captureDailyPokemon() async {
    if (dailyPokemon == null) return;

    final capturedPokemonList = await dailyPokemonService.getCapturedPokemon();

    if (capturedPokemonList.any((p) => p.id == dailyPokemon!.id)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Você já capturou ${dailyPokemon!.name} antes."),
      ));
      return;
    }

    final success = await dailyPokemonService.capturePokemon(dailyPokemon!);
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${dailyPokemon!.name} capturado com sucesso!"),
      ));
      setState(() {
        dailyPokemon = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Você já possui 6 Pokémons."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Imagem de fundo com opacidade baixa
        Opacity(
          opacity: 0.7,
          child: Image.asset(
            'images/poke.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Center(
          child: dailyPokemon != null
              ? Card(
            elevation: 4,
            margin: const EdgeInsets.all(32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network(
                    _getImageUrl(dailyPokemon!.id),
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  dailyPokemon!.name,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _captureDailyPokemon,
                  child: const Text("Capturar"),
                ),
                const SizedBox(height: 16),
              ],
            ),
          )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  String _getImageUrl(int id) {
    final formattedId = id.toString().padLeft(3, '0');
    return 'https://github.com/fanzeyi/pokemon.json/raw/master/thumbnails/$formattedId.png';
  }
}

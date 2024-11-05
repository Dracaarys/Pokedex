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

    // Verifica se o Pokémon já foi capturado
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
        dailyPokemon = null; // Limpa o Pokémon atual
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Você já possui 6 Pokémons."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: dailyPokemon != null
          ? Card(
        elevation: 4,
        margin: const EdgeInsets.all(32), // Aumente a margem do card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Imagem do Pokémon
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                _getImageUrl(dailyPokemon!.id),
                height: 250, // Aumente a altura da imagem
                width: 250,  // Aumente a largura da imagem
                fit: BoxFit.cover,
              ),
            ),
            // Nome do Pokémon
            Text(
              dailyPokemon!.name,
              style: TextStyle(
                fontSize: 28, // Aumente o tamanho da fonte do nome
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16), // espaço entre o nome e o botão
            ElevatedButton(
              onPressed: _captureDailyPokemon,
              child: Text("Capturar"),
            ),
            const SizedBox(height: 16), // espaço inferior
          ],
        ),
      )
          : SizedBox.shrink(),
    );
  }

  String _getImageUrl(int id) {
    final formattedId = id.toString().padLeft(3, '0');
    return 'https://github.com/fanzeyi/pokemon.json/raw/master/thumbnails/$formattedId.png';
  }
}

import 'package:flutter/material.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:pokedex/ui/page/PokemonDetailPage.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    // Formata o ID do Pokémon para ter três dígitos
    final formattedId = pokemon.id.toString().padLeft(3, '0');
    // URL da imagem
    final imageUrl = 'https://github.com/fanzeyi/pokemon.json/raw/master/thumbnails/$formattedId.png';

    return GestureDetector(
      onTap: () {
        // Navega para a página de detalhes do Pokémon
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailPage(pokemon: pokemon),
          ),
        );
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  pokemon.name,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
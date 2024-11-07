import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:pokedex/ui/page/PokemonDetailPage.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onRelease;

  const PokemonCard({super.key, required this.pokemon, required this.onRelease});

  @override
  Widget build(BuildContext context) {
    final formattedId = pokemon.id.toString().padLeft(3, '0');
    final imageUrl = 'https://github.com/fanzeyi/pokemon.json/raw/master/thumbnails/$formattedId.png';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailPage(
              pokemon: pokemon,
              onRelease: onRelease,
            ),
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
              CachedNetworkImage(
                imageUrl: imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
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

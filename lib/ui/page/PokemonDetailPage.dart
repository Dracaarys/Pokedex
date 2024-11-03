import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Formata o ID do Pokémon para ter três dígitos
    final formattedId = pokemon.id.toString().padLeft(3, '0');
    // URL da imagem em alta resolução
    final imageUrl = 'https://github.com/fanzeyi/pokemon.json/raw/master/thumbnails/$formattedId.png';

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          // Exibe a imagem em alta resolução
          CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            width: 250,
            height: 250, // Ajuste a altura conforme necessário
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(height: 16),
          // Exibe as informações do Pokémon
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Base Stats', // Título
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          // Aqui você pode adicionar os detalhes do Pokémon, como HP, Speed, etc.
          // Vamos apenas usar alguns dados de exemplo por enquanto.
          Expanded(
            child: ListView(
              children: [
                _buildStatRow('HP', pokemon.base.hp),
                _buildStatRow('Attack', pokemon.base.attack),
                _buildStatRow('Defense', pokemon.base.defense),
                _buildStatRow('Speed', pokemon.base.speed),
                _buildStatRow('SpAttack', pokemon.base.spAttack),
                _buildStatRow('SpDefense', pokemon.base.spDefense),

                // Adicione mais atributos conforme necessário
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(value.toString(), style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
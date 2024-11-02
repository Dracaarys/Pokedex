import 'package:flutter/material.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon; // Supondo que você tenha uma classe Pokemon

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Adicionando um pouco de padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Você pode adicionar uma imagem aqui se necessário
            // Se o Pokémon tiver uma URL de imagem, você pode usar CachedNetworkImage
            // ou apenas um ícone como exemplo
            const Icon(
              Icons.pets, // Um ícone representativo para Pokémon
              size: 50,
              color: Colors.black,
            ),
            const SizedBox(width: 8), // Espaço entre o ícone e o texto
            Expanded(
              child: Text(
                "${pokemon.id} (${pokemon.name})", // Exibe apenas o nome do Pokémon
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.ellipsis, // Trunca texto se necessário
              ),
            ),
          ],
        ),
      ),
    );
  }
}

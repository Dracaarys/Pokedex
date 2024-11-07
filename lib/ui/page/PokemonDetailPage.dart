import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:pokedex/data/database/dao/daily_service.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class PokemonDetailPage extends StatefulWidget {
  final Pokemon pokemon;
  final VoidCallback onRelease;

  const PokemonDetailPage({
    Key? key,
    required this.pokemon,
    required this.onRelease,
  }) : super(key: key);

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  bool _isCaptured = false;

  @override
  void initState() {
    super.initState();
    _checkIfCaptured();
  }

  Future<void> _checkIfCaptured() async {
    final capturedPokemons = await DailyPokemonService().getCapturedPokemon();
    setState(() {
      _isCaptured = capturedPokemons.any((captured) => captured.id == widget.pokemon.id);
    });
  }

  String _getImageUrl(int id) {
    final formattedId = id.toString().padLeft(3, '0');
    return 'https://github.com/fanzeyi/pokemon.json/raw/master/thumbnails/$formattedId.png';
  }

  @override
  Widget build(BuildContext context) {
    final formattedId = widget.pokemon.id.toString().padLeft(3, '0');
    final imageUrl = _getImageUrl(widget.pokemon.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
        backgroundColor: Colors.redAccent,
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50]!.withOpacity(0.9), // Fundo semi-transparente
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 3, blurRadius: 5),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Base Stats',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      _buildStatRow('HP', widget.pokemon.base.hp, Colors.green),
                      _buildStatRow('Attack', widget.pokemon.base.attack, Colors.red),
                      _buildStatRow('Defense', widget.pokemon.base.defense, Colors.blue),
                      _buildStatRow('Speed', widget.pokemon.base.speed, Colors.orange),
                      _buildStatRow('SpAttack', widget.pokemon.base.spAttack, Colors.purple),
                      _buildStatRow('SpDefense', widget.pokemon.base.spDefense, Colors.teal),
                      const SizedBox(height: 16),

                      Text(
                        'tipo: ${widget.pokemon.type}',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                if (_isCaptured)
                  ElevatedButton(
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.scale,
                        title: 'Confirmar',
                        desc: 'Tem certeza de que deseja soltar ${widget.pokemon.name}?',

                        customHeader: Container(
                          margin: const EdgeInsets.only(bottom: 16.0), // Espaço abaixo da imagem
                          child: CircleAvatar(
                            radius: 50, // Ajuste o tamanho do círculo
                            backgroundImage: NetworkImage(imageUrl), // URL da imagem
                          ),
                        ),
                        btnCancelOnPress: () {},
                        btnOkOnPress: () async {
                          final success = await DailyPokemonService().releasePokemon(widget.pokemon);
                          if (success) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("${widget.pokemon.name} solto com sucesso!"),
                            ));
                            widget.onRelease();
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Erro ao soltar ${widget.pokemon.name}."),
                            ));
                          }
                        },
                      ).show();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text("Soltar"),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, int value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(label, style: const TextStyle(fontSize: 16)),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: value / 100.0,
              color: color,
              backgroundColor: Colors.grey[300],
              minHeight: 8,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value.toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

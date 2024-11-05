import 'package:flutter/material.dart';
import 'package:pokedex/ui/page/daily_page.dart';
import 'package:pokedex/ui/page/my_pokemon_page.dart';
import 'package:pokedex/ui/page/pokemon_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Função decoradora para criar botões estilizados diretamente dentro do build
    Widget buildDecoratedButton(String text, VoidCallback onPressed) {
      return SizedBox(
        width: 200, // Largura maior para os botões
        height: 60, // Altura maior para os botões
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink.shade300, // Cor de fundo rosa
            foregroundColor: Colors.white, // Cor do texto
            textStyle: const TextStyle(
              fontSize: 20, // Aumenta o tamanho da fonte
              fontWeight: FontWeight.bold, // Fonte em negrito
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Borda arredondada
            ),
            padding: const EdgeInsets.symmetric(vertical: 15), // Padding interno
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TELA INICIAL',
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.pink.shade300,

      ),
      body: Stack(
        children: [
          // Imagem de fundo como marca d'água
          Positioned.fill(
            child: Opacity(
              opacity: 0.9,
              child: Image.asset(
                'images/psyduck.jpg', // Caminho da imagem no projeto
                fit: BoxFit.cover, // Expande a imagem para cobrir o fundo
              ),
            ),
          ),
          // Conteúdo principal (botões)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDecoratedButton(
                  'Pokedex',
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PokemonsListPage()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                buildDecoratedButton(
                  'Encontro Diário',
                      () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DailyPokemonPage()),
                      );

                  },
                ),
                const SizedBox(height: 20),
                buildDecoratedButton(
                  'Meus Pokemons',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CapturedPokemonsPage()),
                        );
                    // Ação do botão "Meus Pokemons"
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
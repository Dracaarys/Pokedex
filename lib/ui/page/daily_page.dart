import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pokedex/ui/widget/daily_widget.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/data/repository/poke_repository_Impl.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';

class DailyPokemonPage extends StatefulWidget {
  const DailyPokemonPage({Key? key}) : super(key: key);

  @override
  _DailyPokemonPageState createState() => _DailyPokemonPageState();
}

class _DailyPokemonPageState extends State<DailyPokemonPage> {
  late final PokemonRepositoryImpl pokeRepo;
  List<Pokemon> pokemonList = [];

  @override
  void initState() {
    super.initState();
    pokeRepo = Provider.of<PokemonRepositoryImpl>(context, listen: false);
    _loadPokemons();
  }

  Future<void> _loadPokemons() async {
    try {
      // Carrega um número limitado de Pokémon (exemplo: 20) para escolher um aleatório
      final pokemons = await pokeRepo.getPokemon(page: 1, limit: 400);
      setState(() {
        pokemonList = pokemons;
      });
    } catch (e) {
      print("Erro ao carregar Pokémon: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Encontro Diário"),
      ),
      body: pokemonList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : DailyPokemonWidget(pokemonList: pokemonList),
    );
  }
}

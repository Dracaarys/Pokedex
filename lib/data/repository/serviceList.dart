import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';

class PokemonListService {
  static const String _pokemonListKey = 'pokemon_list';

  Future<List<Pokemon>> getPokemonList() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedPokemonList = prefs.getStringList(_pokemonListKey);

    if (cachedPokemonList != null && cachedPokemonList.isNotEmpty) {
      return cachedPokemonList.map((json) => Pokemon.fromJson(jsonDecode(json))).toList();
    } else {
      return [];
    }
  }

  Future<void> savePokemonList(List<Pokemon> pokemonList) async {
    final prefs = await SharedPreferences.getInstance();
    final pokemonJsonList = pokemonList.map((pokemon) => jsonEncode(pokemon.toJson())).toList();
    await prefs.setStringList(_pokemonListKey, pokemonJsonList);
  }

  Future<void> clearPokemonListCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_pokemonListKey);
  }
}

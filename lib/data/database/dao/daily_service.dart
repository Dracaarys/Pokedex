import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';

class DailyPokemonService {
  static const String _dailyPokemonKey = 'daily_pokemon';
  static const String _lastUpdateTimeKey = 'last_update_time';
  static const String _capturedPokemonKey = 'captured_pokemon';

  Future<Pokemon?> getDailyPokemon(List<Pokemon> pokemonList) async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final lastUpdate = DateTime.tryParse(prefs.getString(_lastUpdateTimeKey) ?? '') ?? DateTime(1970);

    if (now.difference(lastUpdate).inHours >= 24) {
      final randomPokemon = pokemonList[Random().nextInt(pokemonList.length)];

      // Convertendo o Pokémon em JSON string antes de salvar
      prefs.setString(_dailyPokemonKey, jsonEncode(randomPokemon.toJson()));
      prefs.setString(_lastUpdateTimeKey, now.toIso8601String());
      return randomPokemon;
    }

    // Carregando o Pokémon diário a partir de uma JSON string
    final dailyPokemonJson = prefs.getString(_dailyPokemonKey);
    return dailyPokemonJson != null ? Pokemon.fromJson(jsonDecode(dailyPokemonJson)) : null;
  }

  Future<bool> capturePokemon(Pokemon pokemon) async {
    final prefs = await SharedPreferences.getInstance();
    final capturedPokemonList = prefs.getStringList(_capturedPokemonKey) ?? [];

    if (capturedPokemonList.length >= 6) return false;

    // Convertendo o Pokémon em JSON string antes de adicionar à lista
    capturedPokemonList.add(jsonEncode(pokemon.toJson()));
    await prefs.setStringList(_capturedPokemonKey, capturedPokemonList);
    return true;
  }

  Future<List<Pokemon>> getCapturedPokemon() async {
    final prefs = await SharedPreferences.getInstance();
    final capturedPokemonList = prefs.getStringList(_capturedPokemonKey) ?? [];

    // Convertendo cada JSON string de volta em um objeto Pokémon
    return capturedPokemonList.map((json) => Pokemon.fromJson(jsonDecode(json))).toList();
  }

  Future<bool> releasePokemon(Pokemon pokemon) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? capturedPokemons = prefs.getStringList(_capturedPokemonKey); // Altere aqui para usar _capturedPokemonKey

      // Verifica se a lista de capturados existe
      if (capturedPokemons != null) {
        // Remove o Pokémon da lista, caso esteja presente
        capturedPokemons.removeWhere((capturedPokemonJson) {
          // Converte a string JSON de volta para um objeto Pokemon
          final capturedPokemon = Pokemon.fromJson(jsonDecode(capturedPokemonJson));
          return capturedPokemon.id == pokemon.id; // Compara o ID do Pokémon
        });

        // Atualiza a lista no SharedPreferences
        await prefs.setStringList(_capturedPokemonKey, capturedPokemons); // Altere aqui para usar _capturedPokemonKey
      }

      return true; // Retorna true se a soltura foi bem-sucedida
    } catch (e) {
      print("Erro ao soltar Pokémon: $e");
      return false; // Retorna false se houver um erro
    }
  }
}

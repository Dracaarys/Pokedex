import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:pokedex/data/network/entity/http_paged_result.dart';
import 'package:pokedex/domain/exception/network_exception.dart';




class ApiClient {
  late final Dio _dio;

  ApiClient({required String baseUrl}) {
    _dio = Dio()
      ..options.baseUrl = baseUrl
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
  }

  Future<List<PokeEntity>> getPokemons({int? page, int? limit}) async {
    print('Fetching Pokemons from API...');

    try {
      final response = await _dio.get(
        "/pokemon",
        queryParameters: {
          '_page': page,
          '_per_page': limit,
        },
      );

      // Verifique a resposta
      print('Response Data: ${response.data}');

      if (response.statusCode != null && response.statusCode! >= 400) {
        throw NetworkException(
          statusCode: response.statusCode!,
          message: response.statusMessage ?? 'Error fetching data',
        );
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        // A resposta é um objeto e não uma lista
        if (response.data is List) {
          // Se for uma lista
          final List<dynamic> pokemonsJson = response.data;
          return pokemonsJson.map<PokeEntity>((json) => PokeEntity.fromJson(json as Map<String, dynamic>)).toList();
        } else if (response.data is Map) {
          // Se for um mapa, você pode ter que acessar a chave correta
          final pokemonsJson = response.data['data']; // Ajuste aqui conforme a estrutura da resposta
          return (pokemonsJson as List).map<PokeEntity>((json) => PokeEntity.fromJson(json as Map<String, dynamic>)).toList();
        }
      }
    } catch (e) {
      print('Error: $e');
      // Em caso de erro, você pode optar por retornar uma lista vazia ou re-throw a exceção.
      // return []; // Retorne uma lista vazia se preferir.
      rethrow; // Se você quiser propagar o erro
    }

    // Se nenhum dos casos acima for satisfeito, retorne uma lista vazia
    return [];
  }

  }

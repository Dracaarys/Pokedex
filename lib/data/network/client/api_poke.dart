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

  Future<List<Pokemon>> getPokemons({int? page, int? limit}) async {
    print('Fetching Pokemons from API...');

    final response = await _dio.get(
      "/pokemon",
      queryParameters: {
        '_page': page,
        '_per_page': limit,
      },
    );


    if (response.statusCode != null && response.statusCode! >= 400) {
      throw NetworkException(
        statusCode: response.statusCode!,
        message: response.statusMessage ?? 'deu algum erro nessa desgraça',
      );
    } else if (response.statusCode == 200 || response.statusCode == 201) {
      final HttpPagedResult receivedData = HttpPagedResult.fromJson(response.data as Map<String, dynamic>);
      return receivedData.data.map<Pokemon>((json) => Pokemon.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Unknown error ');
    }
  }
}

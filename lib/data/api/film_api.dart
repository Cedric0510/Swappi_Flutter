import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final filmApiProvider = Provider<FilmApi>((ref) {
  return FilmApi();
});

class FilmApi {
  Future<List<Map<String, dynamic>>> getFilms() async {
    final response = await http.get(Uri.parse('https://swapi.info/api/films'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Erreur lors du chargement des films');
    }
  }

  Future<Map<String, dynamic>> getFilmDetail(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Erreur lors du chargement du détail du film');
    }
  }
}

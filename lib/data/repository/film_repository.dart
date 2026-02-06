import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/film_model.dart';
import '../../domain/models/film_detail_model.dart';
import '../api/film_api.dart';

final filmRepositoryProvider = Provider<FilmRepository>((ref) {
  final filmApi = ref.read(filmApiProvider);
  return FilmRepository(filmApi: filmApi);
});

class FilmRepository {
  final FilmApi filmApi;

  // FilmRepository(this.filmApi);
  FilmRepository({required this.filmApi});

  Future<List<Film>> getFilms() async {
    final data = await filmApi.getFilms();
    return data.map((json) => Film.fromJson(json)).toList();
  }

  Future<FilmDetail> getFilmDetail(String url) async {
    final data = await filmApi.getFilmDetail(url);
    return FilmDetail.fromJson(data);
  }
}

import '../../domain/models/film_model.dart';
import '../../domain/models/film_detail_model.dart';
import '../api/film_api.dart';

class FilmRepository {
  final FilmApi filmApi;

  FilmRepository(this.filmApi);

  Future<List<Film>> getFilms() async {
    final data = await filmApi.getFilms();
    return data.map((json) => Film.fromJson(json)).toList();
  }

  Future<FilmDetail> getFilmDetail(String url) async {
    final data = await filmApi.getFilmDetail(url);
    return FilmDetail.fromJson(data);
  }
}

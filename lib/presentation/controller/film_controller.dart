import '../../domain/models/film_model.dart';
import '../../domain/models/film_detail_model.dart';
import '../../data/repository/film_repository.dart';

class FilmController {
  final FilmRepository filmRepository;

  FilmController(this.filmRepository);

  Future<List<Film>> getFilms() async {
    return await filmRepository.getFilms();
  }

  Future<FilmDetail> getFilmDetail(String url) async {
    return await filmRepository.getFilmDetail(url);
  }
}

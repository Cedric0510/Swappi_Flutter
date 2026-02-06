import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/film_model.dart';
import '../../data/repository/film_repository.dart';

final filmControllerProvider =
    AsyncNotifierProvider.autoDispose<FilmController, List<Film>>(
      FilmController.new,
    );

class FilmController extends AsyncNotifier<List<Film>> {
  @override
  Future<List<Film>> build() async {
    final repository = ref.read(filmRepositoryProvider);
    return repository.getFilms();
  }

  void shuffleFilms() {
    final currentFilms = state.value;
    if (currentFilms != null) {
      final shuffledFilms = [...currentFilms]..shuffle();
      state = AsyncData(shuffledFilms);
    }
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:swapi_app/data/repository/film_repository.dart';

import '../../mocks.dart';

void main() {
  final filmApiMock = FilmApiMock();
  test('getFilms should return a list of films', () async {
    when(() => filmApiMock.getFilms()).thenAnswer((_) async => [
          {
            'title': 'A New Hope',
            'episode_id': 4,
            'director': 'George Lucas',
            'release_date': '1977-05-25',
            'url': 'https://swapi.dev/api/films/1/',
          },
        ]);
    final filmRepository = FilmRepository(filmApi: filmApiMock);
    final films = await filmRepository.getFilms();
    expect(films.length, 1);
    expect(films.first.title, 'A New Hope');
  });
}

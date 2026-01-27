import 'package:flutter/material.dart';
import '../../domain/models/film_model.dart';
import '../../data/api/film_api.dart';
import '../../data/repository/film_repository.dart';
import '../controller/film_controller.dart';
import 'widgets/film_card.dart';

class FilmScreen extends StatelessWidget {
  const FilmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final filmApi = FilmApi();
    final filmRepository = FilmRepository(filmApi);
    final filmController = FilmController(filmRepository);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Star Wars Paradise',
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Film>>(
        future: filmController.getFilms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.yellow),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erreur: ${snapshot.error}',
                style: const TextStyle(color: Colors.yellow),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Aucun film trouvé',
                style: TextStyle(color: Colors.yellow),
              ),
            );
          }

          final films = snapshot.data!;

          return Scrollbar(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: films.length,
              itemBuilder: (context, index) {
                final film = films[index];
                return FilmCard(film: film);
              },
            ),
          );
        },
      ),
    );
  }
}

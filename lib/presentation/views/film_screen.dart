import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/film_controller.dart';
import 'widgets/film_card.dart';

class FilmScreen extends ConsumerWidget {
  const FilmScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filmsAsync = ref.watch(filmControllerProvider);

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          ref.read(filmControllerProvider.notifier).shuffleFilms();
        },
        child: const Icon(Icons.shuffle, color: Colors.black),
      ),
      body: filmsAsync.when(
        data: (films) {
          if (films.isEmpty) {
            return const Center(
              child: Text(
                'Aucun film trouvé',
                style: TextStyle(color: Colors.yellow),
              ),
            );
          }
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
        error: (error, stackTrace) {
          return Center(
            child: Text(
              'Erreur: $error',
              style: const TextStyle(color: Colors.yellow),
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(color: Colors.yellow),
          );
        },
      ),
    );
  }
}

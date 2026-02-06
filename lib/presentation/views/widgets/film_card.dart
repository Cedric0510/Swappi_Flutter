import 'package:flutter/material.dart';
import '../../../domain/models/film_model.dart';
import '../film_detail_screen.dart';

class FilmCard extends StatelessWidget {
  final Film film;

  const FilmCard({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FilmDetailScreen(filmUrl: film.url),
          ),
        );
      },
      child: Card(
        color: Colors.black,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.yellow, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                film.title,
                style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Episode ${film.episodeId}',
                style: const TextStyle(color: Colors.yellow, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Réalisateur: ${film.director}',
                style: const TextStyle(color: Colors.yellow, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                'Date de sortie: ${film.releaseDate}',
                style: const TextStyle(color: Colors.yellow, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

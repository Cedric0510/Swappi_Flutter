import 'package:flutter/material.dart';
import '../../domain/models/film_detail_model.dart';
import '../../data/api/film_api.dart';
import '../../data/repository/film_repository.dart';

class FilmDetailScreen extends StatelessWidget {
  final String filmUrl;

  const FilmDetailScreen({super.key, required this.filmUrl});

  @override
  Widget build(BuildContext context) {
    final filmApi = FilmApi();
    final filmRepository = FilmRepository(filmApi: filmApi);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.yellow),
        title: const Text(
          'Détails du film',
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<FilmDetail>(
        future: filmRepository.getFilmDetail(filmUrl),
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

          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'Aucune donnée',
                style: TextStyle(color: Colors.yellow),
              ),
            );
          }

          final filmDetail = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Card(
              color: Colors.black,
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
                      filmDetail.title,
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Description:',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      filmDetail.openingCrawl,
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Réalisateur: ${filmDetail.director}',
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Producteur: ${filmDetail.producer}',
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Année de sortie: ${filmDetail.releaseDate}',
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

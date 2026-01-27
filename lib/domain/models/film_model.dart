class Film {
  final String title;
  final int episodeId;
  final String director;
  final String releaseDate;
  final String url;

  Film({
    required this.title,
    required this.episodeId,
    required this.director,
    required this.releaseDate,
    required this.url,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'],
      episodeId: json['episode_id'],
      director: json['director'],
      releaseDate: json['release_date'],
      url: json['url'],
    );
  }
}

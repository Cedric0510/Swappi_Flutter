class FilmDetail {
  final String title;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;

  FilmDetail({
    required this.title,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
  });

  factory FilmDetail.fromJson(Map<String, dynamic> json) {
    return FilmDetail(
      title: json['title'],
      openingCrawl: json['opening_crawl'],
      director: json['director'],
      producer: json['producer'],
      releaseDate: json['release_date'],
    );
  }
}

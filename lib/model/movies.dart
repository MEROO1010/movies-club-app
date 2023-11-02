class Movie {
  final String title;
  final String overview;
  final String posterUrl;

  Movie({
    required this.title,
    required this.overview,
    required this.posterUrl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      overview: json['overview'],
      posterUrl: json['poster_path'],
    );
  }
}

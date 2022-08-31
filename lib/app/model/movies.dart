import 'dart:convert';

class Movies {
  Movies({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  double voteCount;

  factory Movies.fromJson(Map<String, dynamic> json) {
    List<int> parseGenreIds(List<dynamic> data) {
      var genre = jsonDecode(data.toString());
      return genre != null ? List.from(genre) : <int>[];
    }

    return Movies(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] ?? '',
      genreIds: parseGenreIds(json['genre_ids']),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'].toDouble(),
    );
  }
}

import 'dart:convert';

class Movie {
  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genres,
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
  List<Genre> genres;
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

  factory Movie.fromJson(Map<String, dynamic> json, List<Genre> rawGenre) {
    var genre = jsonDecode(json['genre_ids'].toString());
    List<int> genreIds = genre != null ? List.from(genre) : <int>[];
    List<Genre> genres = rawGenre.where((val) {
      return genreIds.contains(val.id);
    }).toList();

    return Movie(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] ?? '',
      genres: genres,
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

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}

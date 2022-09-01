import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:teangan_film_mobile/app/model/movies.dart';
import 'package:teangan_film_mobile/app/resources/global/path.dart';

class MoviesData {
  static Future<List<Genre>> getListGenres() async {
    final String path = Path.json('genres.json');
    final dynamic rawResponse = await rootBundle.loadString(path);
    List<dynamic> lists = json.decode(rawResponse);
    return lists.map((x) => Genre.fromJson(x)).toList();
  }

  static Future<List<Movie>> getListMovies() async {
    final String path = Path.json('movies.json');
    final dynamic rawResponse = await rootBundle.loadString(path);
    List<dynamic> lists = json.decode(rawResponse);
    List<Genre> genres = await getListGenres();
    return lists.map((x) => Movie.fromJson(x, genres)).toList();
  }
}

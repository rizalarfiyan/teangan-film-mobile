import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:teangan_film_mobile/app/model/movies.dart';
import 'package:teangan_film_mobile/app/resources/global/path.dart';

class MoviesData {
  static Future<List<Movies>> getListMovies() async {
    final String path = Path.json('movies.json');
    final dynamic rawResponse = await rootBundle.loadString(path);
    List<dynamic> lists = json.decode(rawResponse);
    return lists.map((x) => Movies.fromJson(x)).toList();
  }
}

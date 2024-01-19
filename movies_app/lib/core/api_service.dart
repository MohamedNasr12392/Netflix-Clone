import 'dart:convert';

import 'package:movies_app/models/movie/movie.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String BASE_URL = "https://api.tvmaze.com/search/shows?q=comedy";
  Future<List<MovieModel>> getMovies() async {
    List<MovieModel> movies = [];
    var response = await http.get(Uri.parse(BASE_URL));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      for (var item in jsonData) {
        movies.add(MovieModel.fromJson(item));
      }
    }
    print('Movies: $movies');
    return movies;
  }

  Future<List<MovieModel>> getSpecificMovies(String query) async {
    List<MovieModel> movies = [];
    var response = await http
        .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      for (var item in jsonData) {
        movies.add(MovieModel.fromJson(item));
      }
    }
    print('Movies: $movies');
    return movies;
  }
}

import 'dart:convert';

import 'package:movies_favourite/constants.dart';
import 'package:movies_favourite/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?language=en-US&api_key=${Constants.apiKey}';

  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&api_key=${Constants.apiKey}';

  static Future<List<Movie>> getTrendingMovies() async {
    final res = await http.get(Uri.parse(_trendingUrl));

    if (res.statusCode == 200) {
      final decodeData = json.decode(res.body)['results'] as List;

      // print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Api Not Working');
    }
  }

  Future<List<Movie>> getTopRated() async {
    final res = await http.get(Uri.parse(_topRatedUrl));

    if (res.statusCode == 200) {
      final decodeData = json.decode(res.body)['results'] as List;

      // print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Api Not Working');
    }
  }
}

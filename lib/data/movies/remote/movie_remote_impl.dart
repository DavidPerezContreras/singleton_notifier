import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:singleton_notifier/model/movie.dart';

class MovieRemoteImpl {
  Future<List<Movie>> getMovies() async {
    final response = await http.get(Uri.parse('http://10.4.2.43:3000/api'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      print(jsonList.toString());
      final List<Movie> movies =
          jsonList.map((json) => Movie.fromJson(json)).toList();
      return movies;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }
}

import 'package:singleton_notifier/model/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies();
}

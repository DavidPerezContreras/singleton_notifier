import 'package:singleton_notifier/data/movies/remote/movie_remote_impl.dart';
import 'package:singleton_notifier/domain/movie_repository.dart';
import 'package:singleton_notifier/model/movie.dart';

class MovieDataImpl implements MovieRepository {
  final MovieRemoteImpl _movieRemoteImpl;

  MovieDataImpl(this._movieRemoteImpl);

  @override
  Future<List<Movie>> getMovies() {
    return _movieRemoteImpl.getMovies();
  }
}

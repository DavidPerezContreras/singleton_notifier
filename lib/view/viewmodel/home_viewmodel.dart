import 'dart:async';

import 'package:singleton_notifier/domain/movie_repository.dart';
import 'package:singleton_notifier/view/error/error_bundle.dart';
import 'package:singleton_notifier/view/error/resource_state.dart';

class HomeViewModel {
  final MovieRepository _movieRepository;
  final StreamController<ResourceState> _movieStreamController;

  HomeViewModel({
    required r,
  })  : _movieRepository = r,
        _movieStreamController = StreamController<ResourceState>();

  Future<void> fetchMovies() async {
    _movieStreamController.add(ResourceState.loading());

    _movieRepository
        .getMovies()
        .then(
            (data) => _movieStreamController.add(ResourceState.completed(data)))
        .catchError(() {
      return ResourceState.error("");
    });
  }
}

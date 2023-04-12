import 'dart:async';

import 'package:singleton_notifier/domain/movie_repository.dart';
import 'package:singleton_notifier/view/common/error/error_bundle.dart';
import 'package:singleton_notifier/view/common/error/resource_state.dart';
import 'package:singleton_notifier/view/errorhandling/home_error_builder.dart';

class HomeViewModel {
  final MovieRepository movieRepository;
  final StreamController<ResourceState> movieStreamController;

  HomeViewModel({
    required r,
  })  : movieRepository = r,
        movieStreamController = StreamController<ResourceState>();

  Future<void> fetchMovies() async {
    movieStreamController.add(ResourceState.loading());

    movieRepository
        .getMovies()
        .then(
            (data) => movieStreamController.add(ResourceState.completed(data)))
        .catchError((e) {
      movieStreamController.add(ResourceState.error(
          HomeErrorBuilder.create(e, AppAction.GET_MOVIES).build()));
    });
  }
}

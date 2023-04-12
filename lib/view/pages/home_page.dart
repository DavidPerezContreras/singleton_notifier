import 'package:flutter/material.dart';
import 'package:singleton_notifier/data/movie_data_impl.dart';
import 'package:singleton_notifier/data/movies/remote/movie_remote_impl.dart';
import 'package:singleton_notifier/model/movie.dart';
import 'package:singleton_notifier/view/common/error/resource_state.dart';
import 'package:singleton_notifier/view/viewmodel/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    {
  //This should go in the viewModel
  final HomeViewModel _homeViewModel =
      HomeViewModel(r: MovieDataImpl(MovieRemoteImpl()));

  List<Movie> listOfMovies = [];

  @override
  void initState() {
    super.initState();
    print("home initState");


    _homeViewModel.movieStreamController.stream.listen((resourceState) {
      if (resourceState.status == Status.COMPLETED) {
        setState(() {
          listOfMovies = resourceState.data;
        });
      }
    });

    _homeViewModel.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ColoredBox(
        color: const Color.fromARGB(255, 159, 255, 150),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Home",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: RefreshIndicator(
                  onRefresh: () {
                    return _homeViewModel.fetchMovies();
                  },
                  child: ListView(
                    children: [
                      ...listOfMovies
                          .map((e) => ListTile(
                                leading: Image.network(e.poster),
                              ))
                          .toList()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

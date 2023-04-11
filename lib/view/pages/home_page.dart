import 'package:flutter/material.dart';
import 'package:singleton_notifier/data/movie_data_impl.dart';
import 'package:singleton_notifier/data/movies/remote/movie_remote_impl.dart';
import 'package:singleton_notifier/domain/movie_repository.dart';
import 'package:singleton_notifier/model/movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieRepository _movieRepository = MovieDataImpl(MovieRemoteImpl());
  late List<Movie> listOfMovies;

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
              ElevatedButton(
                onPressed: () {
                  _movieRepository.getMovies().then(
                    (value) {
                      listOfMovies = value;
                      print("debug");
                    },
                  ).catchError((e) {
                    //Handle error.
                  });
                },
                child: const Text("Request"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

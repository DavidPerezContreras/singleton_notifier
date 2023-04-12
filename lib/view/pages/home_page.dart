import 'package:flutter/material.dart';
import 'package:singleton_notifier/data/movie_data_impl.dart';
import 'package:singleton_notifier/data/movies/remote/movie_remote_impl.dart';
import 'package:singleton_notifier/model/movie.dart';
import 'package:singleton_notifier/view/common/error/resource_state.dart';
import 'package:singleton_notifier/view/di/singleton.dart';
import 'package:singleton_notifier/view/viewmodel/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
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
      child: Container(
        //color: const Color.fromARGB(255, 159, 255, 150),
        alignment: Alignment.center,
        child: Column(
          children: [
            
            Flexible( //Esto es para que no salte el error 'Vertical viewport was given unbounded height' 
              child: RefreshIndicator(
                onRefresh: () {
                  return _homeViewModel.fetchMovies();
                },
                child: ListView(
                  children: [
                    ...listOfMovies
                        .map((e) => Stack(children: [
                              Card(
                                child: ListTile(
                                  leading: Image.network(e.poster),
                                  title: Text(e.title),
                                  trailing: Text(e.year),
                                  onTap: () {
                                    RouteSingleton.instance.pageController
                                        .animateToPage(2,
                                            duration: const Duration(
                                                milliseconds: 900),
                                            curve: Curves.easeOutExpo);
                                  },
                                ),
                              ),
                              const Divider()
                            ]))
                        .toList()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

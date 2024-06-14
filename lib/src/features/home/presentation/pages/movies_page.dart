import 'package:article_app/src/core/utils/injections/injections.dart';
import 'package:article_app/src/features/home/presentation/bloc/movies_bloc.dart';
import 'package:article_app/src/features/home/presentation/bloc/movies_event.dart';
import 'package:article_app/src/features/home/presentation/bloc/movies_state.dart';
import 'package:article_app/src/features/home/presentation/widgets/header/home_header.dart';
import 'package:article_app/src/features/home/presentation/widgets/items/popular_movies_card_items.dart';
import 'package:article_app/src/features/home/presentation/widgets/items/top_rated_movies_card_items.dart';
import 'package:article_app/src/features/home/presentation/widgets/items/upcoming_movies_card_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final MoviesBloc _bloc = MoviesBloc(sl(), sl(), sl(), sl());

  @override
  void initState() {
    fetchMovies();
    super.initState();
  }

  void fetchMovies() {
    _bloc.add(OnFetchingMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: BlocBuilder<MoviesBloc, MoviesState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is LoadingMoviesState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is SucceededMoviesState) {
              return Column(
                children: [
                  HomeHeader(data: state.nowPlaying),
                  const SizedBox(height: 8),
                  UpcomingMoviesCardItems(state.upcoming),
                  TopRatedMoviesCardItems(state.topRated),
                  PopularCardItems(state.popular)
                ],
              );
            }

            if (state is FailedMoviesState) {
              return const Center(
                child: Text('Sorry something went wrong please try agaiin...'),
              );
            }
            return const Text('data');
          },
        ),
      ),
    );
  }
}
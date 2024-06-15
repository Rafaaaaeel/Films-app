import 'package:article_app/src/core/utils/injections/injections.dart';
import 'package:article_app/src/features/home/domain/entities/content/content_entity.dart';
import 'package:article_app/src/features/home/domain/entities/movies/movie_entity.dart';
import 'package:article_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:article_app/src/features/home/presentation/bloc/home_event.dart';
import 'package:article_app/src/features/home/presentation/bloc/home_state.dart';
import 'package:article_app/src/features/home/presentation/widgets/header/home_header.dart';
import 'package:article_app/src/features/home/presentation/widgets/items/popular_movies_card_items.dart';
import 'package:article_app/src/features/home/presentation/widgets/items/popular_series_card_items.dart';
import 'package:article_app/src/features/home/presentation/widgets/items/top_rated_movies_card_items.dart';
import 'package:article_app/src/features/home/presentation/widgets/items/upcoming_movies_card_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(sl(), sl(), sl(), sl(), sl(), sl())
        ..add(OnFetchingMoviesEvent()),
      child: const MoviesPageContent(),
    );
  }
}

class MoviesPageContent extends StatelessWidget {
  const MoviesPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: BlocBuilder<HomeBloc, HomesState>(
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
                  PopularSeriesCardItems(state.poularSeries),
                  PopularCardItems(state.popular)
                ],
              );
            }

            if (state is FailedMoviesState) {
              return const Center(
                child: Text('Sorry something went wrong please try again...'),
              );
            }
            return const Text('data');
          },
        ),
      ),
    );
  }
}

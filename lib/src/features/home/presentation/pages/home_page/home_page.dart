import 'package:article_app/src/core/utils/injections/injections.dart';
import 'package:article_app/src/features/home/presentation/pages/home_page/bloc/home/home_bloc.dart';
import 'package:article_app/src/features/home/presentation/pages/home_page/bloc/home/home_event.dart';
import 'package:article_app/src/features/home/presentation/pages/home_page/bloc/home/home_state.dart';
import 'package:article_app/src/features/home/presentation/pages/home_page/controller/home_controller.dart';
import 'package:article_app/src/features/home/presentation/pages/home_page/widgets/header/home_header.dart';
import 'package:article_app/src/features/home/presentation/pages/home_page/widgets/items/popular_movies_card_items.dart';
import 'package:article_app/src/features/home/presentation/pages/home_page/widgets/items/popular_series_card_items.dart';
import 'package:article_app/src/features/home/presentation/pages/home_page/widgets/items/top_rated_movies_card_items.dart';
import 'package:article_app/src/features/home/presentation/pages/home_page/widgets/items/upcoming_movies_card_items.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      )..add(OnFetchingMoviesEvent()),
      child: HomePageContent(),
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  final HomeController _controller = HomeController();
  int currentIndex = 0;

  int getIndex(double offset, double width) {
    _controller.updateIndex(offset, width);
    return _controller.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedIndex: currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.house),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: "Search",
          ),
        ],
      ),
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
              _controller.shows = state.nowPlaying;
              return Column(
                children: [
                  HomeHeader(state.nowPlaying, _controller.length, getIndex),
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

import 'package:article_app/src/features/home/domain/entities/movies/movie_entity.dart';
import 'package:article_app/src/core/widgets/section/content_section.dart';
import 'package:flutter/material.dart';

class UpcomingMoviesCardItems extends StatelessWidget {
  final List<MovieEntity> _movies;

  const UpcomingMoviesCardItems(this._movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return ContentSection(
      title: 'Upcoming',
      axis: Axis.horizontal,
      hasIndex: false,
      data: _movies,
    );
  }
}

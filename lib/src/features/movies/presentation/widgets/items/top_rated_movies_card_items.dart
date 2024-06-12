import 'package:article_app/src/features/movies/domain/entities/movie_entity.dart';
import 'package:article_app/src/core/widgets/section/content_section.dart';
import 'package:flutter/material.dart';

class TopRatedMoviesCardItems extends StatelessWidget {
  final List<MovieEntity> _movies;

  const TopRatedMoviesCardItems(this._movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return ContentSection(
      title: 'Most rated',
      axis: Axis.horizontal,
      hasIndex: true,
      data: _movies,
    );
  }
}

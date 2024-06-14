import 'package:article_app/src/features/home/domain/entities/movies/movie_entity.dart';
import 'package:article_app/src/core/widgets/section/content_section.dart';

import 'package:flutter/material.dart';

class PopularCardItems extends StatelessWidget {
  final List<MovieEntity> _movies;

  const PopularCardItems(this._movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return ContentSection(
      axis: Axis.vertical,
      title: 'Popular right now',
      hasIndex: false,
      data: _movies,
    );
  }
}

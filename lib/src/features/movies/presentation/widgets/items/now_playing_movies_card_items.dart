import 'package:article_app/src/features/movies/domain/entities/movie_entity.dart';
import 'package:article_app/src/core/widgets/section/content_section.dart';
import 'package:flutter/material.dart';

class NowPlayingCardItems extends StatelessWidget {
  final List<MovieEntity> _movies;

  const NowPlayingCardItems(this._movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return ContentSection(
      title: 'Now Playing',
      axis: Axis.vertical,
      hasIndex: false,
      data: _movies,
    );
  }
}

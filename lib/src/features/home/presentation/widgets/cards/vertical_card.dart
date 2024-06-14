import 'package:article_app/src/features/home/domain/entities/content_entity.dart';
import 'package:flutter/material.dart';

class VerticalCard<T extends ContentEntity> extends StatelessWidget {
  final T _movie;

  const VerticalCard(this._movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 130,
        child: Image.network(
          _movie.posterPath!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

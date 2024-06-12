import 'package:article_app/src/features/movies/domain/entities/content_entity.dart';
import 'package:flutter/material.dart';

class HorizontalCard<T extends ContentEntity> extends StatelessWidget {
  final T _movie;
  final String? index;
  const HorizontalCard(this._movie, {this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: 170,
              height: 100,
              child: Image.network(
                'https://image.tmdb.org/t/p/w342/${_movie.backdropPath ?? ""}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (index == null)
            Text(_movie.title)
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  index!,
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      Text(
                        _movie.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white),
                        maxLines: 1,
                      ),
                      Text(
                        _movie.genreNames.first,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}

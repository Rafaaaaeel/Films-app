import 'package:article_app/src/core/widgets/space/horizontal/horizontal_safe.dart';
import 'package:article_app/src/core/widgets/space/vertical/vertical_space.dart';
import 'package:article_app/src/features/home/domain/entities/content/content_entity.dart';
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
                _movie.backdropPath!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (index == null)
            Text(_movie.title, maxLines: 1)
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  index!,
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const HorizontalSpace(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalSpace(),
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

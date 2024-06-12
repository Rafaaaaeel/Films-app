import 'package:article_app/src/core/widgets/texts/title_text.dart';
import 'package:article_app/src/features/movies/domain/entities/content_entity.dart';
import 'package:article_app/src/features/movies/presentation/widgets/cards/horizontal_card.dart';
import 'package:article_app/src/features/movies/presentation/widgets/cards/vertical_card.dart';
import 'package:flutter/material.dart';

class ContentSection<T extends ContentEntity> extends StatelessWidget {
  final String title;
  final Axis axis;
  final List<T> data;
  final bool hasIndex;

  const ContentSection({
    required this.title,
    required this.axis,
    required this.hasIndex,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TitleText(title: title),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: axis == Axis.horizontal
              ? hasIndex
                  ? 150
                  : 120
              : 200,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) => axis == Axis.horizontal
                ? HorizontalCard(
                    data[index],
                    index: hasIndex ? '${index + 1}' : null,
                  )
                : VerticalCard(data[index]),
            separatorBuilder: (_, index) => const SizedBox(width: 10),
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

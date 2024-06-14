import 'package:article_app/src/core/widgets/section/content_section.dart';
import 'package:article_app/src/features/home/domain/usecases/series_popular_usecase.dart';
import 'package:flutter/material.dart';

class PopularSeriesCardItems extends StatelessWidget {
  final Series _series;

  const PopularSeriesCardItems(this._series, {super.key});

  @override
  Widget build(BuildContext context) {
    return ContentSection(
      title: "Recommended shows",
      axis: Axis.horizontal,
      hasIndex: false,
      data: _series,
    );
  }
}

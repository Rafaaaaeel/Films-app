import 'package:article_app/src/features/home/domain/entities/database/watch_later_entity.dart';
import 'dart:convert';

class WatchLaterModel extends WatchLaterEntity {
  WatchLaterModel(
    super.id,
    super.title,
    super.description,
    super.posterPath,
    super.backdropPath,
    super.genreIds,
    super.genreNames,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'posterPath': posterPath,
      'backdropPath': backdropPath,
      'genreIds': jsonEncode(genreIds),
      'genreNames': jsonEncode(genreNames),
    };
  }

  factory WatchLaterModel.fromMap(Map<String, dynamic> map) {
    return WatchLaterModel(
      map['id'],
      map['title'],
      map['description'],
      map['posterPath'],
      map['backdropPath'],
      List<int>.from(jsonDecode(map['genreIds'])),
      List<String>.from(jsonDecode(map['genreNames'])),
    );
  }
}

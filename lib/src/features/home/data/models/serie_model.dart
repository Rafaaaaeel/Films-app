import 'package:article_app/src/features/home/domain/entities/serie_entity.dart';

class SerieModel extends SerieEntity {
  SerieModel(
    super.id,
    super.title,
    super.description,
    super.posterPath,
    super.backdropPath,
    super.genreIds,
    super.genreNames,
  );

   factory SerieModel.fromJson(Map<String, dynamic> json) {
    Map<int, String> genreMap = {
      28: 'Action',
      12: 'Adventure',
      16: 'Animation',
      35: 'Comedy',
      80: 'Crime',
      99: 'Documentary',
      18: 'Drama',
      10751: 'Family',
      14: 'Fantasy',
      36: 'History',
      27: 'Horror',
      10402: 'Music',
      9648: 'Music',
      10749: 'Romance',
      878: 'Science Fiction',
      10770: 'TV Movie',
      53: 'Thriller',
      10752: 'War',
      37: 'War',
    };

    List<int> genreIds =
        (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList() ??
            [];
    List<String> genreNames =
        genreIds.map((id) => genreMap[id] ?? 'Unknown').toList();
    String backdropPath =
        'https://image.tmdb.org/t/p/original/${json['backdrop_path'] ?? ''}';
    String posterImage =
        'https://image.tmdb.org/t/p/original/${json['poster_path'] ?? ''}';

    return SerieModel(
      json['id'],
      json['title'],
      json['overview'],
      posterImage,
      backdropPath,
      genreIds,
      genreNames,
    );
  }
}

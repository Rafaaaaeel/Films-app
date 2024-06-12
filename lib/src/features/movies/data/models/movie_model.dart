import 'package:article_app/src/features/movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel(super.id, super.title, super.posterPath, super.backdropPath,
      super.genreIds, super.genreNames);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
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

    return MovieModel(json['id'], json['title'], json['poster_path'] ?? '',
        json['backdrop_path'] ?? '', genreIds, genreNames);
  }
}

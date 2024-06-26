abstract class ContentEntity {
  final int id;
  final String title;
  final String description;
  final String? posterPath;
  final String? backdropPath;
  final List<int> genreIds;
  final List<String> genreNames;

  ContentEntity(
    this.id,
    this.title,
    this.description,
    this.posterPath,
    this.backdropPath,
    this.genreIds,
    this.genreNames,
  );
}

abstract class MovieEntity{
  final int id;
  final voteAverage;
  final String title;
  final String posterPath;
  final String overview;
  final String backdropPath;
  final String releaseDate;
  final int voteCount;

  MovieEntity(this.backdropPath, this.voteCount, this.releaseDate,
      {this.id, this.voteAverage, this.title, this.posterPath, this.overview});
}
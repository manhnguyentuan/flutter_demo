import 'package:dio/dio.dart';
import 'package:flutter_review_movie/core/core.dart';
import 'package:rxdart/rxdart.dart';

class MovieRepoImpl extends MovieRepos {
  final MovieNetWorkSource movieNetWorkSource;

  MovieRepoImpl(this.movieNetWorkSource);

  @override
  Observable<List<MovieEntity>> getNowPlayingMovies() {
    return Observable.fromFuture(
            movieNetWorkSource.getMovies(Config.NOW_PLAYING))
        .map((movieResponse) => movieResponse.movies);
  }

  @override
  Observable<List<TrailerEntity>> getTrailerByMovieId(int movieId) {
    return Observable.fromFuture(
            movieNetWorkSource.getTrailerByMovieId(movieId))
        .map((trailerResponse) => trailerResponse.trailers);
  }

  @override
  Observable<List<Movie>> getTopRatedMovies() {
    return Observable.fromFuture(movieNetWorkSource.getMovies(Config.TOP_RATED))
        .map((movieResponse) => movieResponse.movies);
  }

  @override
  Observable<List<Movie>> getUpComingMovies() {
    return Observable.fromFuture(movieNetWorkSource.getMovies(Config.UPCOMING))
        .map((movieResponse) => movieResponse.movies);
  }
}

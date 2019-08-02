import 'package:flutter_review_movie/core/core.dart';
import 'package:rxdart/rxdart.dart';

abstract class MovieRepos {
  Observable<List<MovieEntity>> getNowPlayingMovies();

  Observable<List<MovieEntity>> getUpComingMovies();

  Observable<List<MovieEntity>> getTopRatedMovies();

  Observable<List<TrailerEntity>> getTrailerByMovieId(int movieId);
}

import 'package:flutter_review_movie/core/core.dart';

class MovieBloc extends BaseBloc {
  final MovieUseCase _nowPlayingMovieUseCase;
  final MovieUseCase _upComingMovieUseCase;
  final MovieUseCase _topRatedMovieUseCase;

  MovieBloc(this._nowPlayingMovieUseCase,this._upComingMovieUseCase,this._topRatedMovieUseCase) {
    _upComingMovieUseCase.execute();
    _upComingMovieUseCase.error
        .listen((errorMessage) => error.add(errorMessage));
    _topRatedMovieUseCase.execute();
    _topRatedMovieUseCase.error
        .listen((errorMessage) => error.add(errorMessage));
    _nowPlayingMovieUseCase.execute();
    _nowPlayingMovieUseCase.error
        .listen((errorMessage) => error.add(errorMessage));
  }

  Stream<String> errorMessageNowPlaying() => _nowPlayingMovieUseCase.error;

  Stream<List<MovieEntity>> getNowPlayingMovies() => _nowPlayingMovieUseCase.movie;

  Stream<String> errorMessageUpcoming() => _upComingMovieUseCase.error;

  Stream<List<MovieEntity>> getUpcomingMovies() => _upComingMovieUseCase.movie;

  Stream<String> errorMessageTopRated() => _nowPlayingMovieUseCase.error;

  Stream<List<MovieEntity>> getTopRatedMovies() => _nowPlayingMovieUseCase.movie;
  @override
  void dispose() {
    _nowPlayingMovieUseCase.dispose();
    super.dispose();
  }
}

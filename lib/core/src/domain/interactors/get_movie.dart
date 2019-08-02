import 'package:flutter_review_movie/core/core.dart';
import 'package:rxdart/rxdart.dart';

import 'use_case.dart';

class MovieUseCase extends UseCase<MovieRepos, void> {
 final BehaviorSubject<List<MovieEntity>> _movie = BehaviorSubject();
 final BehaviorSubject<String> _errorMessage = BehaviorSubject();

  Stream<List<MovieEntity>> get movie => _movie.stream;

  Stream<String> get error => _errorMessage.stream;

  MovieUseCase(MovieRepos repository) : super(repository);

  @override
  void execute({void param}) {
    repository.getNowPlayingMovies().listen((movies) => _movie.sink.add(movies),
        onError: (error) => _errorMessage.sink.add(error.toString()));
  }

  @override
  void dispose() {
    _movie.close();
    _errorMessage.close();
  }
}

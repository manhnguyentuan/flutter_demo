import 'package:flutter_review_movie/core/core.dart';
import 'package:rxdart/rxdart.dart';

import 'use_case.dart';

class TrailersUseCase extends UseCase<MovieRepos, int> {
  BehaviorSubject<List<TrailerEntity>> _trailers = BehaviorSubject();
  BehaviorSubject<String> _errorMessage = BehaviorSubject();

  Stream<List<TrailerEntity>> get trailers => _trailers.stream;

  Stream<String> get errorMessage => _errorMessage.stream;

  TrailersUseCase(MovieRepos repository) : super(repository);

  @override
  void execute({int param}) {
    repository.getTrailerByMovieId(param).listen(
        (trailers) => _trailers.sink.add(trailers),
        onError: (errorMessage) => _errorMessage.sink.add(errorMessage));
  }

  @override
  void dispose() {
    _trailers.close();
    _errorMessage.close();
  }
}

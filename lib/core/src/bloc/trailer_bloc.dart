import 'package:flutter_review_movie/core/core.dart';
import 'package:rxdart/rxdart.dart';

class TrailerBloc extends BaseBloc {
  BehaviorSubject<int> _movieId = BehaviorSubject();
  final TrailersUseCase _trailersUseCase;

  Sink<int> get movieId => _movieId.sink;

  TrailerBloc(this._trailersUseCase) {
    _movieId.stream
        .listen((movieId) => _trailersUseCase.execute(param: movieId));

    _trailersUseCase.errorMessage
        .listen((errorMessage) => error.add(errorMessage));
  }

  Stream<List<TrailerEntity>> getTrailers() => _trailersUseCase.trailers;

  Stream<String> errorMessage() => _trailersUseCase.errorMessage;

  @override
  void dispose() {
    super.dispose();
    _movieId.close();
    _trailersUseCase.dispose();
  }
}

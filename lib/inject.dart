import 'package:dio/dio.dart';
import 'package:flutter_review_movie/core/core.dart';
import 'package:flutter_review_movie/di/injector.dart';

class Injection {
  static Injector injector;

  static void initInjection() {
    injector = Injector.getInjector();

    injector.map<Dio>((i) => Config.instance(), isSingleton: true);

    injector.map<MovieNetWorkSource>((i)=> MovieNetWorkSource(injector.get<Dio>()));

    injector.map<MovieRepos>((i) => MovieRepoImpl(injector.get<MovieNetWorkSource>()));

    injector.map<MovieUseCase>((i) => MovieUseCase(injector.get<MovieRepos>()));

    injector.map<TrailersUseCase>(
        (i) => TrailersUseCase(injector.get<MovieRepos>()));

    injector.map<MovieBloc>((i) => MovieBloc(injector.get<MovieUseCase>(),
        injector.get<MovieUseCase>(), injector.get<MovieUseCase>()));

    injector
        .map<TrailerBloc>((i) => TrailerBloc(injector.get<TrailersUseCase>()));
  }
}

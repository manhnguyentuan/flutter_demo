import 'package:dio/dio.dart';

class Config {
  static const BASE_URL = 'https://api.themoviedb.org/3/movie';
  static const API_KEY = 'e0cfbba4815cad8a435c7caa472ab7bf';
  static const NOW_PLAYING ='/now_playing';
  static const UPCOMING = '/upcoming';
  static const TOP_RATED = '/top_rated';
  static const POSTER_PATH_URL = 'https://image.tmdb.org/t/p/w185';
  static const BACKDROP_PATH_URL = 'https://image.tmdb.org/t/p/w500';

  static Dio instance() {
    Dio dio = Dio();
    dio.options.baseUrl = BASE_URL;
    dio.options.receiveTimeout = 5000;
    dio.options.connectTimeout = 5000;

    return dio;
  }
}

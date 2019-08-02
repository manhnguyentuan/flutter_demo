import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_review_movie/core/core.dart';
import 'end_point.dart';

class MovieNetWorkSource {
  final Dio dio;

  Future<MovieResponse> getMovies(String subPath) async {
    try {
      var response =
          await dio.get(subPath, queryParameters: {"api_key": Config.API_KEY});

      return MovieResponse.fromJSON(response.data);
    } catch (error) {
      return MovieResponse.errorValue(error.toString());
    }
  }

  Future<TrailerResponse> getTrailerByMovieId(int movieId) async {
    try {
      var response = await dio.get('/$movieId/videos',
          queryParameters: {"api_key": Config.API_KEY});

      return TrailerResponse.fromJson(response.data);
    } catch (error) {
      return TrailerResponse.errorValue(error.toString());
    }
  }

  MovieNetWorkSource(this.dio);
}

import 'package:flutter_review_movie/core/core.dart';

class TrailerResponse {
  final int id;

  final List<Trailer> trailers;

  TrailerResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        trailers = (json['results'] as List)
            .map((trailer) => Trailer.fromJson(trailer))
            .toList();

  static errorValue(String error) => print(error);

}

class Trailer extends TrailerEntity{
  String key;

  Trailer({this.key});

  Trailer.fromJson(Map<String, dynamic> json) : key = json['key'];
}

String getImageVideoUrl(String key) {
  return 'https://i1.ytimg.com/vi/$key/0.jpg';
}

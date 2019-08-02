import 'package:flutter_review_movie/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_review_movie/mobie/ui/pages/detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePageBottom extends StatelessWidget {
  final MovieBloc bloc;

  const HomePageBottom({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _createTile(Movie movie) => ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
              splashColor: Colors.red,
              enableFeedback: true,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(movie: movie),
                    ));
              },
              child: CachedNetworkImage(
                imageUrl: '${Config.POSTER_PATH_URL}${movie.posterPath}',
                fit: BoxFit.cover,
                errorWidget: (context, error, obj) => Icon(Icons.error),
              )),
        );

    _createList(String title, Stream<List<MovieEntity>> streamListMovie) =>
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  Text('VIEW ALL', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 250),
              padding: const EdgeInsets.all(16.0),
              child: StreamBuilder(
                stream: streamListMovie,
                builder: (BuildContext context,
                    AsyncSnapshot<List<MovieEntity>> snapshot) {
                  if (!snapshot.hasData || snapshot.hasError)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  List<Movie> movies = snapshot.data;

                  print('size : ${movies.length}');

                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: _createTile(movies[index]),
                        );
                      });
                },
              ),
            ),
          ],
        );

    return Column(
      children: <Widget>[
        _createList('Now Playing', bloc.getNowPlayingMovies()),
      ],
    );
  }
}

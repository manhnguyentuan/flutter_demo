import 'package:flutter_review_movie/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_review_movie/inject.dart';
import 'package:flutter_review_movie/mobie/ui/base/base_bloc_scaffold_widget.dart';
import 'package:flutter_review_movie/mobie/ui/common/custom_shape_clipper.dart';
import 'home_page_bottom.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MovieBloc bloc = Injection.injector.get<MovieBloc>();

    return BaseBlocScaffoldWidget(
        bloc: bloc,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: CustomShapeClipper(),
                child: Container(
                  height: 300,
                  color: Colors.yellow,
                ),
              ),
              HomePageBottom(bloc: bloc),
            ],
          ),
        ));
  }
}

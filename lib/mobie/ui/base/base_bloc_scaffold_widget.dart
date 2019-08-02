import 'package:flutter/material.dart';
import 'package:flutter_review_movie/core/core.dart';
import 'base_bloc_widget.dart';

class BaseBlocScaffoldWidget extends BaseBlocWidget {
  final AppBar appBar;

  BaseBlocScaffoldWidget({BaseBloc bloc, Widget body, this.appBar})
      : super(bloc, body);

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: appBar ?? null,
        body: super.body(context),
      ),
    );
  }
}

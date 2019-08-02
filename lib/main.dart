import 'package:flutter/material.dart';
import 'package:flutter_review_movie/mobie/ui/pages/home/home_page.dart';

import 'inject.dart';

void main() {
  Injection.initInjection();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
          primaryColor: Colors.grey[900], accentColor: Colors.orangeAccent),
      home: HomePage(),
    );
  }
}



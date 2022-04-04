import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/beamer/articles_location.dart';
import 'package:flutter_web_app_navigation/beamer/books_location.dart';
import 'package:flutter_web_app_navigation/screens/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<BeamerState> _beamerKey = GlobalKey<BeamerState>();

  final BeamerDelegate _routerDelegate = BeamerDelegate(
      locationBuilder: BeamerLocationBuilder(beamLocations: [
    BooksLocation(),
    ArticlesLocation(),
  ]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Beamer(
        key: _beamerKey,
        routerDelegate: _routerDelegate,
      ),
      bottomNavigationBar: BottomNavBar(beamerKey: _beamerKey),
    );
  }
}

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/beamer/books_location.dart';
import 'package:flutter_web_app_navigation/beamer/contacts_location.dart';
import 'package:flutter_web_app_navigation/provider/contacts_provider.dart';
import 'package:provider/provider.dart';

void main() {
  Beamer.setPathUrlStrategy();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ContactsProvider(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        BooksLocation(),
        ContactsLocation(),
      ],
    ),
    notFoundRedirectNamed: '/404',
  );
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher:
          BeamerBackButtonDispatcher(delegate: routerDelegate),
    );
  }
}

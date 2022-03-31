import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/screens/home_screen.dart';
import 'package:flutter_web_app_navigation/screens/page_not_found.dart';

class AuthLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [];
    pages.add(const BeamPage(
      key: ValueKey("Home"),
      title: "HomePage", //Title Name in Browser
      child: HomeScreen(),
    ));

    if (state.uri.path.contains("404")) {
      pages.add(const BeamPage(
        key: ValueKey("Page not found"),
        title: "Page not found",
        child: PageNotFound(),
      ));
    }
    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [
        "/404",
        "/",
      ];
}

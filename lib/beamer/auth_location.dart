import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/provider/auth_provider.dart';
import 'package:flutter_web_app_navigation/screens/home_screen.dart';
import 'package:flutter_web_app_navigation/screens/login_page_screen.dart';
import 'package:flutter_web_app_navigation/screens/page_not_found.dart';
import 'package:provider/provider.dart';

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

    if (state.uri.path.contains("login")) {
      pages.add(const BeamPage(
        key: ValueKey("login"),
        title: "Login",
        child: LoginScreen(),
      ));
    }
    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [
        "/404",
        "/",
        "/login",
      ];

  @override
  List<BeamGuard> get guards => <BeamGuard>[
        BeamGuard(
            pathPatterns: [
              "/",
            ],
            check: (context, location) {
              return context.read<AuthProvider>().isLoggedIn ?? false;
            },
            beamToNamed: (_, __) => "/login")
      ];
}

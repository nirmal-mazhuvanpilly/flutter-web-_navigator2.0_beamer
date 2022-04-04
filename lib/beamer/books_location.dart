import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/models/book.dart';
import 'package:flutter_web_app_navigation/provider/auth_provider.dart';
import 'package:flutter_web_app_navigation/screens/books_detail_screen.dart';
import 'package:flutter_web_app_navigation/screens/books_screen.dart';
import 'package:flutter_web_app_navigation/screens/page_not_found.dart';
import 'package:provider/provider.dart';

class BooksLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [];

    if (state.uri.path.contains("404")) {
      pages.add(const BeamPage(
        key: ValueKey("Page not found"),
        title: "Page not found",
        child: PageNotFound(),
      ));
    }

    if (state.uri.path.contains("books")) {
      pages.add(const BeamPage(
        type: BeamPageType.fadeTransition,
        key: ValueKey("Books"),
        title: "Books",
        child: BooksScreen(),
      ));
    }

    final String? bookIdParameter = state.pathParameters["bookId"];
    if (bookIdParameter != null) {
      // Book? bookData = data as Book?; // Data passed from the screen
      final bookId = int.tryParse(bookIdParameter);
      bool isPage = BookList.bookList!.any((element) => element.id == bookId);
      if (isPage) {
        final book = BookList.bookList?.firstWhere((book) => book.id == bookId);
        if (book != null) {
          pages.add(
            BeamPage(
              key: ValueKey('Book-$bookIdParameter'),
              title: 'Book $bookIdParameter',
              child: BooksDetailsScreen(
                book: book,
              ),
            ),
          );
        }
      } else {
        pages.add(const BeamPage(
          key: ValueKey("Page not found"),
          title: "Page not found",
          child: PageNotFound(),
        ));
      }
    }
    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [
        "/404",
        "/books/:bookId",
        "/books",
        "/",
      ];

  @override
  List<BeamGuard> get guards => <BeamGuard>[
        BeamGuard(
            pathPatterns: [
              "/books/*",
              "/books",
            ],
            check: (context, location) {
              return context.read<AuthProvider>().isLoggedIn;
            },
            beamToNamed: (_, __) => "/login"),
      ];
}

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/models/book.dart';
import 'package:flutter_web_app_navigation/screens/books_detail_screen.dart';
import 'package:flutter_web_app_navigation/screens/books_screen.dart';
import 'package:flutter_web_app_navigation/screens/home_screen.dart';

class BooksLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [];
    pages.add(const BeamPage(
      key: ValueKey("Home"),
      title: "HomePage",
      child: HomeScreen(),
    ));
    if (state.uri.pathSegments.contains("books")) {
      pages.add(BeamPage(
        type: BeamPageType.fadeTransition,
        key: const ValueKey("Books"),
        title: "Books",
        child: BooksScreen(),
      ));
    }
    final String? bookIdParameter = state.pathParameters["bookId"];
    if (bookIdParameter != null) {
      // final bookId = int.tryParse(bookIdParameter);
      Book? bookData = data as Book?;
      if (bookData != null) {
        pages.add(
          BeamPage(
            key: ValueKey('Book-$bookIdParameter'),
            title: 'Book #$bookIdParameter',
            child: BooksDetailsScreen(
              book: bookData,
            ),
          ),
        );
      }
    }
    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [
        "/books/:bookId",
        "/",
      ];
}

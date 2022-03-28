import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/models/book.dart';
import 'package:flutter_web_app_navigation/screens/books_detail_screen.dart';
import 'package:flutter_web_app_navigation/screens/books_screen.dart';
import 'package:flutter_web_app_navigation/screens/home_screen.dart';
import 'package:flutter_web_app_navigation/screens/page_not_found.dart';

class BooksLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [];
    pages.add(const BeamPage(
      key: ValueKey("Home"),
      title: "HomePage", //Title Name in Browser
      child: HomeScreen(),
    ));
    if (state.uri.pathSegments.contains("books")) {
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
        "/books/:bookId",
        "/",
      ];
}

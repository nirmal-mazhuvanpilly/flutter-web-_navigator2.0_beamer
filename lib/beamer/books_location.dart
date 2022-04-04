import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/data/datas.dart';
import 'package:flutter_web_app_navigation/screens/book_details_screen.dart';
import 'package:flutter_web_app_navigation/screens/books_screen.dart';

class BooksLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [
        "/",
        "/books",
        "/books/:bookId",
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [];

    pages.add(const BeamPage(
      key: ValueKey<String>("Books"),
      title: "Books",
      type: BeamPageType.fadeTransition,
      child: BooksScreen(),
    ));

    if (state.pathParameters.containsKey("bookId")) {
      pages.add(
        BeamPage(
          key: ValueKey('Book-${state.pathParameters['bookId']}'),
          title: books.firstWhere(
              (book) => book['id'] == state.pathParameters['bookId'])['title'],
          child: BookDetailsScreen(
            book: books.firstWhere(
                (book) => book['id'] == state.pathParameters['bookId']),
          ),
        ),
      );
    }

    return pages;
  }
}

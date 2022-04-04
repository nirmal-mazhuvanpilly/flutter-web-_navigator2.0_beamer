import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/data/datas.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: books
            .map((book) => ListTile(
                  title: Text(book["title"] ?? ""),
                  subtitle: Text(book["author"] ?? ""),
                  onTap: () => context.beamToNamed("/books/${book["id"]}"),
                ))
            .toList(),
      ),
    );
  }
}

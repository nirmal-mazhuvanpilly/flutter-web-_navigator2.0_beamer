import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  final Map<String, String>? book;
  const BookDetailsScreen({Key? key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Title ${book?["title"]}"),
            Text("Author ${book?["author"]}"),
          ],
        ),
      ),
    );
  }
}

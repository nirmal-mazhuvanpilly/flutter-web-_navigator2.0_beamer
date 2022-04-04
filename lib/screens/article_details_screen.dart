import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Map<String, String>? articles;
  const ArticleDetailsScreen({Key? key, this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Title ${articles?["title"]}"),
            Text("Author ${articles?["author"]}"),
          ],
        ),
      ),
    );
  }
}

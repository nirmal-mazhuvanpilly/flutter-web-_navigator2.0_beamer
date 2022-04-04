import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/data/datas.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: articles
            .map((article) => ListTile(
                  title: Text(article["title"] ?? ""),
                  subtitle: Text(article["author"] ?? ""),
                  onTap: () => context.beamToNamed("/articles/${article["id"]}"),
                ))
            .toList(),
      ),
    );
  }
}

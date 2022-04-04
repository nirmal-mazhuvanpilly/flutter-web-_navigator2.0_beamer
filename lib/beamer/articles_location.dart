import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/data/datas.dart';
import 'package:flutter_web_app_navigation/screens/article_details_screen.dart';
import 'package:flutter_web_app_navigation/screens/articles_screen.dart';

class ArticlesLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [
        "/",
        "/articles",
        "/articles/:articleId",
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [];

    pages.add(const BeamPage(
      key: ValueKey<String>("Articles"),
      title: "Articles",
      type: BeamPageType.fadeTransition,
      child: ArticlesScreen(),
    ));

    if (state.pathParameters.containsKey("articleId")) {
      pages.add(
        BeamPage(
          key: ValueKey('Article-${state.pathParameters['articleId']}'),
          title: articles.firstWhere((article) =>
              article['id'] == state.pathParameters['articleId'])['title'],
          child: ArticleDetailsScreen(
            articles: articles.firstWhere((article) =>
                article['id'] == state.pathParameters['articleId']),
          ),
        ),
      );
    }

    return pages;
  }
}

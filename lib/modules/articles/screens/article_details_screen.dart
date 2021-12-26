import 'package:auto_route/auto_route.dart';
import 'package:enterprise_flutter/modules/articles/models/article_item.dart';
import 'package:enterprise_flutter/modules/articles/views/article_details_view.dart';
import 'package:flutter/material.dart';

import '../article_api.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final int id;
  final _api = ArticleApi();

  ArticleDetailsScreen({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ArticleItem>(
        future: _api.getArticle(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final article = snapshot.data!;

            return ArticleDetailsView(article: article);
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:enterprise_flutter/modules/articles/article_api.dart';
import 'package:enterprise_flutter/modules/articles/models/article_item.dart';
import 'package:enterprise_flutter/modules/articles/views/article_form_view.dart';
import 'package:flutter/material.dart';

class UpdateArticleScreen extends StatelessWidget {
  final int id;
  final _articleApi = ArticleApi();

  UpdateArticleScreen({
    Key? key,
    @PathParam('id') required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ArticleItem>(
          future: _articleApi.getArticle(id),
          builder: (context, snapshot) {
            final article = snapshot.data;

            if (snapshot.hasData) {
              return ArticleFormView(
                submitText: 'Update',
                initialValues: article,
                onSubmitted: (value) async {
                  await _articleApi.updateArticle(id, value);
                  context.router.navigateNamed('/admin/articles');
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

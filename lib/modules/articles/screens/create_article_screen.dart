import 'package:dio/dio.dart';
import 'package:enterprise_flutter/modules/articles/article_api.dart';
import 'package:enterprise_flutter/modules/articles/views/article_form_view.dart';
import 'package:flutter/material.dart';

class CreateArticleScreen extends StatelessWidget {
  final _articleApi = ArticleApi();

  CreateArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleFormView(
      submitText: 'Create',
      onSubmitted: (value) async {
        try {
          await _articleApi.createArticle(value);
        } on DioError catch (_) {}
      },
    );
  }
}

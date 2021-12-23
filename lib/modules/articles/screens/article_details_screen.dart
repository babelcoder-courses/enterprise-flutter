import 'package:auto_route/auto_route.dart';
import 'package:enterprise_flutter/modules/articles/views/article_details_view.dart';
import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final int id;
  const ArticleDetailsScreen({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleDetailsView(
      id: id,
    );
  }
}

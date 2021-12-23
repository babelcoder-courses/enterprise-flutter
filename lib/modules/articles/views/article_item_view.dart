import 'package:enterprise_flutter/modules/articles/models/article_item.dart';
import 'package:enterprise_flutter/modules/shared/articles_theme.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:auto_route/auto_route.dart';

class ArticleItemView extends StatelessWidget {
  final ArticleItem article;

  const ArticleItemView({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        article.title,
        style: ArticlesTheme.dark().textTheme.bodyText1,
      ),
      subtitle: Text(
        article.category.name,
        style: ArticlesTheme.dark().textTheme.bodyText2,
      ),
      leading: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: article.image,
        width: 75,
      ),
      onTap: () => context.router.pushNamed('/articles/${article.id}'),
    );
  }
}

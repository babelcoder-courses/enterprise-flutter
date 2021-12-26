import 'package:enterprise_flutter/modules/articles/models/article_item.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:auto_route/auto_route.dart';

class AdminArticleItemView extends StatelessWidget {
  final int index;
  final ArticleItem article;
  final Function(int, int) onRemoved;

  const AdminArticleItemView({
    Key? key,
    required this.index,
    required this.article,
    required this.onRemoved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        article.title,
      ),
      subtitle: Text(
        article.category.name,
      ),
      leading: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: article.image,
        width: 75,
      ),
      trailing: IconButton(
        onPressed: () => onRemoved(index, article.id),
        icon: const Icon(Icons.delete),
      ),
      onTap: () =>
          context.router.navigateNamed('/admin/articles/${article.id}/edit'),
    );
  }
}

import 'package:enterprise_flutter/modules/articles/article_api.dart';
import 'package:enterprise_flutter/modules/articles/models/article_item.dart';
import 'package:enterprise_flutter/modules/articles/views/author_view.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ArticleDetailsView extends StatelessWidget {
  final ArticleItem article;

  const ArticleDetailsView({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: article.image,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Chip(
                      label: Text(
                        article.category.name,
                      ),
                    ),
                  ),
                  Text(article.body),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthorView(
                    author: article.user,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

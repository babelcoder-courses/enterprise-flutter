import 'package:enterprise_flutter/modules/articles/models/article_item.dart';
import 'package:enterprise_flutter/modules/articles/models/favorite_article.dart';
import 'package:enterprise_flutter/modules/articles/views/author_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:transparent_image/transparent_image.dart';

class ArticleDetailsView extends StatelessWidget {
  final ArticleItem article;

  const ArticleDetailsView({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: article.image,
              width: MediaQuery.of(context).size.width,
              height: 250,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.topRight,
              child: ValueListenableBuilder<Box<FavoriteArticle>>(
                valueListenable:
                    Hive.box<FavoriteArticle>('favorite_articles').listenable(),
                builder: (context, box, widget) {
                  final isFavorited = box.get(article.id) != null;

                  return IconButton(
                    icon: const Icon(Icons.favorite),
                    color: isFavorited ? Colors.red : Colors.black,
                    onPressed: () {
                      if (isFavorited) {
                        box.delete(article.id);
                        return;
                      }

                      box.put(
                        article.id,
                        FavoriteArticle(
                          id: article.id,
                          title: article.title,
                          image: article.image,
                          categoryName: article.category.name,
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
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
    );
  }
}

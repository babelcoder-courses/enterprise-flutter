import 'package:enterprise_flutter/modules/articles/models/favorite_article.dart';
import 'package:enterprise_flutter/modules/settings/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';

class FavoriteArticlesScreen extends StatelessWidget {
  const FavoriteArticlesScreen({Key? key}) : super(key: key);

  get kTransparentImage => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box<FavoriteArticle>>(
        valueListenable:
            Hive.box<FavoriteArticle>('favorite_articles').listenable(),
        builder: (context, box, child) {
          final favoriteArticles = box.values;

          if (favoriteArticles.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/images/not-found.png'),
                  Text(
                    'No Favorite Articles',
                    style: context
                        .read<SettingsProvider>()
                        .theme
                        .textTheme
                        .headline2,
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            itemCount: favoriteArticles.length,
            itemBuilder: (context, index) {
              final article = favoriteArticles.elementAt(index);

              return ListTile(
                title: Text(
                  article.title,
                ),
                subtitle: Text(
                  article.categoryName,
                ),
                leading: ClipRRect(
                  child: Image.network(
                    article.image,
                    width: 75,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                trailing: ValueListenableBuilder<Box<FavoriteArticle>>(
                  valueListenable:
                      Hive.box<FavoriteArticle>('favorite_articles')
                          .listenable(),
                  builder: (context, box, widget) {
                    return IconButton(
                      onPressed: () => box.delete(article.id),
                      icon: const Icon(Icons.delete),
                    );
                  },
                ),
                onTap: () =>
                    context.router.navigateNamed('/articles/${article.id}'),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          );
        },
      ),
    );
  }
}

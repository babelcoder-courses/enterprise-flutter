import 'package:hive_flutter/hive_flutter.dart';

part 'favorite_article.g.dart';

@HiveType(typeId: 0)
class FavoriteArticle extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String categoryName;

  @HiveField(3)
  String image;

  FavoriteArticle({
    required this.id,
    required this.title,
    required this.categoryName,
    required this.image,
  });
}

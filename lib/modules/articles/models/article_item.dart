import 'package:enterprise_flutter/modules/categories/models/category_item.dart';
import 'package:enterprise_flutter/modules/users/models/user_item.dart';

class ArticleItem {
  const ArticleItem({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.body,
    required this.image,
    required this.categoryId,
    required this.userId,
    required this.category,
    required this.user,
  });

  final int id;
  final String title;
  final String excerpt;
  final String body;
  final String image;
  final int categoryId;
  final int userId;
  final Category category;
  final User user;

  factory ArticleItem.fromJson(Map<String, dynamic> json) => ArticleItem(
        id: json["id"],
        title: json["title"],
        excerpt: json["excerpt"],
        body: json["body"],
        image: json["image"],
        categoryId: json["categoryId"],
        userId: json["userId"],
        category: Category.fromJson(json["category"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "excerpt": excerpt,
        "body": body,
        "image": image,
        "categoryId": categoryId,
        "userId": userId,
        "category": category.toJson(),
        "user": user.toJson(),
      };
}

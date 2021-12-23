import 'package:enterprise_flutter/modules/articles/models/article_item.dart';
import 'package:enterprise_flutter/modules/shared/models/paging.dart';

class ArticleList {
  const ArticleList({
    required this.items,
    required this.paging,
  });

  final List<ArticleItem> items;
  final Paging paging;

  factory ArticleList.fromJson(Map<String, dynamic> json) {
    final articleList = json['articles'];

    return ArticleList(
      items: List<ArticleItem>.from(
          articleList["items"].map((x) => ArticleItem.fromJson(x))),
      paging: Paging.fromJson(articleList["paging"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "paging": paging.toJson(),
      };
}

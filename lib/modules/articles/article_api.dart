import 'package:enterprise_flutter/modules/articles/models/article_item.dart';
import 'package:enterprise_flutter/modules/articles/models/article_list.dart';
import 'package:enterprise_flutter/modules/shared/base_api.dart';

class ArticleApi extends BaseApi {
  Future<ArticleList> getArticleList([int page = 1]) async {
    var response = await api.get('/articles?page=$page');

    return ArticleList.fromJson(response.data);
  }

  Future<ArticleItem> getArticle(int id) async {
    var response = await api.get('/articles/$id');

    return ArticleItem.fromJson(response.data['article']);
  }
}

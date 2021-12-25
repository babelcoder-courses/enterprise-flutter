import 'package:dio/dio.dart';
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

  createArticle(Map<String, dynamic> data) async {
    final imagePath = data['image'][0].path;

    final formData = FormData.fromMap({
      'title': data['title'],
      'body': data['body'],
      'excerpt': data['excerpt'],
      'categoryId': data['categoryId'],
      'image': await MultipartFile.fromFile(
        imagePath,
        filename: imagePath.split('/').last,
      ),
    });

    await api.post('/articles', data: formData);
  }
}

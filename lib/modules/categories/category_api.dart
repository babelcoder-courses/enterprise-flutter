import 'package:enterprise_flutter/modules/categories/models/category_item.dart';
import 'package:enterprise_flutter/modules/shared/base_api.dart';

class CategoryApi extends BaseApi {
  Future<List<Category>> getCategoryList() async {
    final response = await api.get('/categories');

    return List.from(response.data['categories'])
        .map(
          (json) => Category.fromJson(json),
        )
        .toList();
  }
}

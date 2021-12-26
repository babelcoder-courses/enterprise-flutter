import 'package:auto_route/auto_route.dart';
import 'package:enterprise_flutter/modules/articles/article_api.dart';
import 'package:enterprise_flutter/modules/articles/models/article_item.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'admin_article_item_view.dart';

class AdminArticleListView extends StatefulWidget {
  const AdminArticleListView({Key? key}) : super(key: key);

  @override
  State<AdminArticleListView> createState() => _AdminArticleListViewState();
}

class _AdminArticleListViewState extends State<AdminArticleListView> {
  final _articleApi = ArticleApi();
  final PagingController<int, ArticleItem> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
  }

  void removeArticle(int index, int id) async {
    await _articleApi.deleteArticle(id);

    setState(() {
      _pagingController.itemList?.removeAt(index);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final articleList = await _articleApi.getArticleList(pageKey);
      final items = articleList.items;
      final paging = articleList.paging;
      final isLastPage = paging.page == paging.totalPages;

      if (isLastPage) {
        _pagingController.appendLastPage(items);
      } else {
        _pagingController.appendPage(items, paging.nextPage);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: PagedListView<int, ArticleItem>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, article, index) {
              return AdminArticleItemView(
                index: index,
                article: article,
                onRemoved: removeArticle,
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await context.router.pushNamed('/admin/articles/new');
          _pagingController.refresh();
        },
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:enterprise_flutter/modules/articles/screens/admin_article_list_screen.dart';
import 'package:enterprise_flutter/modules/articles/screens/article_details_screen.dart';
import 'package:enterprise_flutter/modules/articles/screens/article_list_screen.dart';
import 'package:enterprise_flutter/modules/articles/screens/create_article_screen.dart';
import 'package:enterprise_flutter/modules/articles/screens/favorite_articles_screen.dart';
import 'package:enterprise_flutter/modules/auth/screens/login_screen.dart';
import 'package:enterprise_flutter/modules/auth/screens/register_screen.dart';
import 'package:enterprise_flutter/modules/explore/screens/explore.dart';
import 'package:enterprise_flutter/modules/home/screens/base_admin_screen.dart';
import 'package:enterprise_flutter/modules/settings/screens/settings_screen.dart';
import 'package:enterprise_flutter/modules/home/screens/base_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: [
  AutoRoute(
    path: '/auth',
    name: 'AuthRoutes',
    page: EmptyRouterPage,
    children: [
      AutoRoute(
        path: 'login',
        page: LoginScreen,
        initial: true,
      ),
      AutoRoute(
        path: 'register',
        page: RegisterScreen,
      ),
    ],
  ),
  AutoRoute(
    path: '/admin',
    page: BaseAdminScreen,
    children: [
      AutoRoute(
        path: 'articles',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: AdminArticleListScreen,
          ),
          AutoRoute(
            path: 'new',
            page: CreateArticleScreen,
          ),
        ],
      ),
    ],
  ),
  AutoRoute(
    path: '/',
    page: BaseScreen,
    children: [
      AutoRoute(
        path: 'explore',
        page: ExploreScreen,
      ),
      AutoRoute(
        path: 'articles',
        name: 'ArticlesRoutes',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: ArticleListScreen,
            initial: true,
          ),
          AutoRoute(
            path: ':id',
            page: ArticleDetailsScreen,
          ),
        ],
      ),
      AutoRoute(
        path: 'settings',
        name: 'SettingsRoutes',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: SettingsScreen,
          ),
          AutoRoute(
            path: 'favorite-articles',
            page: FavoriteArticlesScreen,
          ),
        ],
      ),
    ],
  ),
])
class $AppRouter {}

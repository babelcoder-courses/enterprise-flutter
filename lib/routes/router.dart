import 'package:auto_route/auto_route.dart';
import 'package:enterprise_flutter/modules/articles/screens/admin_article_list_screen.dart';
import 'package:enterprise_flutter/modules/articles/screens/article_details_screen.dart';
import 'package:enterprise_flutter/modules/articles/screens/article_list_screen.dart';
import 'package:enterprise_flutter/modules/articles/screens/create_article_screen.dart';
import 'package:enterprise_flutter/modules/articles/screens/favorite_articles_screen.dart';
import 'package:enterprise_flutter/modules/articles/screens/update_article_screen.dart';
import 'package:enterprise_flutter/modules/auth/guards/admin_guard.dart';
import 'package:enterprise_flutter/modules/auth/guards/already_authenticated_guard.dart';
import 'package:enterprise_flutter/modules/auth/guards/auth_guard.dart';
import 'package:enterprise_flutter/modules/auth/screens/login_screen.dart';
import 'package:enterprise_flutter/modules/auth/screens/profile_screen.dart';
import 'package:enterprise_flutter/modules/auth/screens/register_screen.dart';
import 'package:enterprise_flutter/modules/explore/screens/explore_screen.dart';
import 'package:enterprise_flutter/modules/home/screens/base_admin_screen.dart';
import 'package:enterprise_flutter/modules/settings/screens/settings_screen.dart';
import 'package:enterprise_flutter/modules/home/screens/base_screen.dart';
import 'package:enterprise_flutter/modules/users/screens/admin_user_list_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: [
  AutoRoute(
    path: '/profile',
    page: ProfileScreen,
    guards: [AuthGuard],
  ),
  AutoRoute(
    path: '/auth',
    name: 'AuthRoutes',
    page: EmptyRouterScreen,
    guards: [AlreadyAuthenticatedGuard],
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
    guards: [AuthGuard, AdminGuard],
    children: [
      AutoRoute(
        path: 'articles',
        name: 'AdminArticlesRoutes',
        page: EmptyRouterPage,
        initial: true,
        children: [
          AutoRoute(
            path: '',
            page: AdminArticleListScreen,
            initial: true,
          ),
          AutoRoute(
            path: 'new',
            page: CreateArticleScreen,
          ),
          AutoRoute(
            path: ':id/edit',
            page: UpdateArticleScreen,
          ),
        ],
      ),
      AutoRoute(
        path: 'users',
        name: 'AdminUsersRoutes',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: AdminUserListScreen,
            initial: true,
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

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i13;

import '../modules/articles/screens/admin_article_list_screen.dart' as _i6;
import '../modules/articles/screens/article_details_screen.dart' as _i10;
import '../modules/articles/screens/article_list_screen.dart' as _i9;
import '../modules/articles/screens/create_article_screen.dart' as _i7;
import '../modules/articles/screens/favorite_articles_screen.dart' as _i12;
import '../modules/auth/screens/login_screen.dart' as _i4;
import '../modules/auth/screens/register_screen.dart' as _i5;
import '../modules/explore/screens/explore.dart' as _i8;
import '../modules/home/screens/base_admin_screen.dart' as _i2;
import '../modules/home/screens/base_screen.dart' as _i3;
import '../modules/settings/screens/settings_screen.dart' as _i11;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    AuthRoutes.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    BaseAdminRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.BaseAdminScreen());
    },
    BaseRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BaseScreen());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.LoginScreen(key: args.key));
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.RegisterScreen(key: args.key));
    },
    EmptyRouterPage.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    AdminArticleListRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.AdminArticleListScreen());
    },
    CreateArticleRoute.name: (routeData) {
      final args = routeData.argsAs<CreateArticleRouteArgs>(
          orElse: () => const CreateArticleRouteArgs());
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.CreateArticleScreen(key: args.key));
    },
    ExploreRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ExploreScreen());
    },
    ArticlesRoutes.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    SettingsRoutes.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    ArticleListRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ArticleListScreen());
    },
    ArticleDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ArticleDetailsRouteArgs>(
          orElse: () => ArticleDetailsRouteArgs(id: pathParams.getInt('id')));
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.ArticleDetailsScreen(key: args.key, id: args.id));
    },
    SettingsRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.SettingsScreen());
    },
    FavoriteArticlesRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.FavoriteArticlesScreen());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(AuthRoutes.name, path: '/auth', children: [
          _i1.RouteConfig('#redirect',
              path: '',
              parent: AuthRoutes.name,
              redirectTo: 'login',
              fullMatch: true),
          _i1.RouteConfig(LoginRoute.name,
              path: 'login', parent: AuthRoutes.name),
          _i1.RouteConfig(RegisterRoute.name,
              path: 'register', parent: AuthRoutes.name)
        ]),
        _i1.RouteConfig(BaseAdminRoute.name, path: '/admin', children: [
          _i1.RouteConfig(EmptyRouterPage.name,
              path: 'articles',
              parent: BaseAdminRoute.name,
              children: [
                _i1.RouteConfig(AdminArticleListRoute.name,
                    path: '', parent: EmptyRouterPage.name),
                _i1.RouteConfig(CreateArticleRoute.name,
                    path: 'new', parent: EmptyRouterPage.name)
              ])
        ]),
        _i1.RouteConfig(BaseRoute.name, path: '/', children: [
          _i1.RouteConfig(ExploreRoute.name,
              path: 'explore', parent: BaseRoute.name),
          _i1.RouteConfig(ArticlesRoutes.name,
              path: 'articles',
              parent: BaseRoute.name,
              children: [
                _i1.RouteConfig(ArticleListRoute.name,
                    path: '', parent: ArticlesRoutes.name),
                _i1.RouteConfig(ArticleDetailsRoute.name,
                    path: ':id', parent: ArticlesRoutes.name)
              ]),
          _i1.RouteConfig(SettingsRoutes.name,
              path: 'settings',
              parent: BaseRoute.name,
              children: [
                _i1.RouteConfig(SettingsRoute.name,
                    path: '', parent: SettingsRoutes.name),
                _i1.RouteConfig(FavoriteArticlesRoute.name,
                    path: 'favorite-articles', parent: SettingsRoutes.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class AuthRoutes extends _i1.PageRouteInfo<void> {
  const AuthRoutes({List<_i1.PageRouteInfo>? children})
      : super(AuthRoutes.name, path: '/auth', initialChildren: children);

  static const String name = 'AuthRoutes';
}

/// generated route for
/// [_i2.BaseAdminScreen]
class BaseAdminRoute extends _i1.PageRouteInfo<void> {
  const BaseAdminRoute({List<_i1.PageRouteInfo>? children})
      : super(BaseAdminRoute.name, path: '/admin', initialChildren: children);

  static const String name = 'BaseAdminRoute';
}

/// generated route for
/// [_i3.BaseScreen]
class BaseRoute extends _i1.PageRouteInfo<void> {
  const BaseRoute({List<_i1.PageRouteInfo>? children})
      : super(BaseRoute.name, path: '/', initialChildren: children);

  static const String name = 'BaseRoute';
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i1.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i13.Key? key})
      : super(LoginRoute.name, path: 'login', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterRoute extends _i1.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i13.Key? key})
      : super(RegisterRoute.name,
            path: 'register', args: RegisterRouteArgs(key: key));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterPage extends _i1.PageRouteInfo<void> {
  const EmptyRouterPage({List<_i1.PageRouteInfo>? children})
      : super(EmptyRouterPage.name,
            path: 'articles', initialChildren: children);

  static const String name = 'EmptyRouterPage';
}

/// generated route for
/// [_i6.AdminArticleListScreen]
class AdminArticleListRoute extends _i1.PageRouteInfo<void> {
  const AdminArticleListRoute() : super(AdminArticleListRoute.name, path: '');

  static const String name = 'AdminArticleListRoute';
}

/// generated route for
/// [_i7.CreateArticleScreen]
class CreateArticleRoute extends _i1.PageRouteInfo<CreateArticleRouteArgs> {
  CreateArticleRoute({_i13.Key? key})
      : super(CreateArticleRoute.name,
            path: 'new', args: CreateArticleRouteArgs(key: key));

  static const String name = 'CreateArticleRoute';
}

class CreateArticleRouteArgs {
  const CreateArticleRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'CreateArticleRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ExploreScreen]
class ExploreRoute extends _i1.PageRouteInfo<void> {
  const ExploreRoute() : super(ExploreRoute.name, path: 'explore');

  static const String name = 'ExploreRoute';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class ArticlesRoutes extends _i1.PageRouteInfo<void> {
  const ArticlesRoutes({List<_i1.PageRouteInfo>? children})
      : super(ArticlesRoutes.name, path: 'articles', initialChildren: children);

  static const String name = 'ArticlesRoutes';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class SettingsRoutes extends _i1.PageRouteInfo<void> {
  const SettingsRoutes({List<_i1.PageRouteInfo>? children})
      : super(SettingsRoutes.name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRoutes';
}

/// generated route for
/// [_i9.ArticleListScreen]
class ArticleListRoute extends _i1.PageRouteInfo<void> {
  const ArticleListRoute() : super(ArticleListRoute.name, path: '');

  static const String name = 'ArticleListRoute';
}

/// generated route for
/// [_i10.ArticleDetailsScreen]
class ArticleDetailsRoute extends _i1.PageRouteInfo<ArticleDetailsRouteArgs> {
  ArticleDetailsRoute({_i13.Key? key, required int id})
      : super(ArticleDetailsRoute.name,
            path: ':id',
            args: ArticleDetailsRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'ArticleDetailsRoute';
}

class ArticleDetailsRouteArgs {
  const ArticleDetailsRouteArgs({this.key, required this.id});

  final _i13.Key? key;

  final int id;

  @override
  String toString() {
    return 'ArticleDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i11.SettingsScreen]
class SettingsRoute extends _i1.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i12.FavoriteArticlesScreen]
class FavoriteArticlesRoute extends _i1.PageRouteInfo<void> {
  const FavoriteArticlesRoute()
      : super(FavoriteArticlesRoute.name, path: 'favorite-articles');

  static const String name = 'FavoriteArticlesRoute';
}

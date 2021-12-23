// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i7;

import '../modules/articles/screens/article_details_screen.dart' as _i6;
import '../modules/articles/screens/article_list_screen.dart' as _i5;
import '../modules/explore/screens/explore.dart' as _i2;
import '../modules/home/screens/base_screen.dart' as _i1;
import '../modules/settings/screens/settings_screen.dart' as _i4;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    BaseRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.BaseScreen());
    },
    ExploreRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ExploreScreen());
    },
    ArticlesRoutes.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    SettingsRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SettingsScreen());
    },
    ArticleListRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ArticleListScreen());
    },
    ArticleDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ArticleDetailsRouteArgs>(
          orElse: () => ArticleDetailsRouteArgs(id: pathParams.getInt('id')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.ArticleDetailsScreen(key: args.key, id: args.id));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(BaseRoute.name, path: '/', children: [
          _i3.RouteConfig(ExploreRoute.name,
              path: 'explore', parent: BaseRoute.name),
          _i3.RouteConfig(ArticlesRoutes.name,
              path: 'articles',
              parent: BaseRoute.name,
              children: [
                _i3.RouteConfig(ArticleListRoute.name,
                    path: '', parent: ArticlesRoutes.name),
                _i3.RouteConfig(ArticleDetailsRoute.name,
                    path: ':id', parent: ArticlesRoutes.name)
              ]),
          _i3.RouteConfig(SettingsRoute.name,
              path: 'settings', parent: BaseRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.BaseScreen]
class BaseRoute extends _i3.PageRouteInfo<void> {
  const BaseRoute({List<_i3.PageRouteInfo>? children})
      : super(BaseRoute.name, path: '/', initialChildren: children);

  static const String name = 'BaseRoute';
}

/// generated route for
/// [_i2.ExploreScreen]
class ExploreRoute extends _i3.PageRouteInfo<void> {
  const ExploreRoute() : super(ExploreRoute.name, path: 'explore');

  static const String name = 'ExploreRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ArticlesRoutes extends _i3.PageRouteInfo<void> {
  const ArticlesRoutes({List<_i3.PageRouteInfo>? children})
      : super(ArticlesRoutes.name, path: 'articles', initialChildren: children);

  static const String name = 'ArticlesRoutes';
}

/// generated route for
/// [_i4.SettingsScreen]
class SettingsRoute extends _i3.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i5.ArticleListScreen]
class ArticleListRoute extends _i3.PageRouteInfo<void> {
  const ArticleListRoute() : super(ArticleListRoute.name, path: '');

  static const String name = 'ArticleListRoute';
}

/// generated route for
/// [_i6.ArticleDetailsScreen]
class ArticleDetailsRoute extends _i3.PageRouteInfo<ArticleDetailsRouteArgs> {
  ArticleDetailsRoute({_i7.Key? key, required int id})
      : super(ArticleDetailsRoute.name,
            path: ':id',
            args: ArticleDetailsRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'ArticleDetailsRoute';
}

class ArticleDetailsRouteArgs {
  const ArticleDetailsRouteArgs({this.key, required this.id});

  final _i7.Key? key;

  final int id;

  @override
  String toString() {
    return 'ArticleDetailsRouteArgs{key: $key, id: $id}';
  }
}

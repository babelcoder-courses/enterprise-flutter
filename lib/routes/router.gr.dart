// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i16;

import '../modules/articles/screens/admin_article_list_screen.dart' as _i7;
import '../modules/articles/screens/article_details_screen.dart' as _i13;
import '../modules/articles/screens/article_list_screen.dart' as _i12;
import '../modules/articles/screens/create_article_screen.dart' as _i8;
import '../modules/articles/screens/favorite_articles_screen.dart' as _i15;
import '../modules/articles/screens/update_article_screen.dart' as _i9;
import '../modules/auth/guards/admin_guard.dart' as _i19;
import '../modules/auth/guards/already_authenticated_guard.dart' as _i18;
import '../modules/auth/guards/auth_guard.dart' as _i17;
import '../modules/auth/screens/login_screen.dart' as _i5;
import '../modules/auth/screens/profile_screen.dart' as _i1;
import '../modules/auth/screens/register_screen.dart' as _i6;
import '../modules/explore/screens/explore.dart' as _i11;
import '../modules/home/screens/base_admin_screen.dart' as _i3;
import '../modules/home/screens/base_screen.dart' as _i4;
import '../modules/settings/screens/settings_screen.dart' as _i14;
import '../modules/users/screens/admin_user_list_screen.dart' as _i10;

class AppRouter extends _i2.RootStackRouter {
  AppRouter(
      {_i16.GlobalKey<_i16.NavigatorState>? navigatorKey,
      required this.authGuard,
      required this.alreadyAuthenticatedGuard,
      required this.adminGuard})
      : super(navigatorKey);

  final _i17.AuthGuard authGuard;

  final _i18.AlreadyAuthenticatedGuard alreadyAuthenticatedGuard;

  final _i19.AdminGuard adminGuard;

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    ProfileRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ProfileScreen());
    },
    AuthRoutes.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterScreen());
    },
    BaseAdminRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BaseAdminScreen());
    },
    BaseRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.BaseScreen());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.LoginScreen(key: args.key));
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.RegisterScreen(key: args.key));
    },
    AdminArticlesRoutes.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    AdminUsersRoutes.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    AdminArticleListRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AdminArticleListScreen());
    },
    CreateArticleRoute.name: (routeData) {
      final args = routeData.argsAs<CreateArticleRouteArgs>(
          orElse: () => const CreateArticleRouteArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.CreateArticleScreen(key: args.key));
    },
    UpdateArticleRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UpdateArticleRouteArgs>(
          orElse: () => UpdateArticleRouteArgs(id: pathParams.getInt('id')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.UpdateArticleScreen(key: args.key, id: args.id));
    },
    AdminUserListRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.AdminUserListScreen());
    },
    ExploreRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ExploreScreen());
    },
    ArticlesRoutes.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    SettingsRoutes.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    ArticleListRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.ArticleListScreen());
    },
    ArticleDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ArticleDetailsRouteArgs>(
          orElse: () => ArticleDetailsRouteArgs(id: pathParams.getInt('id')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.ArticleDetailsScreen(key: args.key, id: args.id));
    },
    SettingsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.SettingsScreen());
    },
    FavoriteArticlesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.FavoriteArticlesScreen());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(ProfileRoute.name,
            path: '/profile', guards: [authGuard]),
        _i2.RouteConfig(AuthRoutes.name, path: '/auth', guards: [
          alreadyAuthenticatedGuard
        ], children: [
          _i2.RouteConfig('#redirect',
              path: '',
              parent: AuthRoutes.name,
              redirectTo: 'login',
              fullMatch: true),
          _i2.RouteConfig(LoginRoute.name,
              path: 'login', parent: AuthRoutes.name),
          _i2.RouteConfig(RegisterRoute.name,
              path: 'register', parent: AuthRoutes.name)
        ]),
        _i2.RouteConfig(BaseAdminRoute.name, path: '/admin', guards: [
          authGuard,
          adminGuard
        ], children: [
          _i2.RouteConfig('#redirect',
              path: '',
              parent: BaseAdminRoute.name,
              redirectTo: 'articles',
              fullMatch: true),
          _i2.RouteConfig(AdminArticlesRoutes.name,
              path: 'articles',
              parent: BaseAdminRoute.name,
              children: [
                _i2.RouteConfig(AdminArticleListRoute.name,
                    path: '', parent: AdminArticlesRoutes.name),
                _i2.RouteConfig(CreateArticleRoute.name,
                    path: 'new', parent: AdminArticlesRoutes.name),
                _i2.RouteConfig(UpdateArticleRoute.name,
                    path: ':id/edit', parent: AdminArticlesRoutes.name)
              ]),
          _i2.RouteConfig(AdminUsersRoutes.name,
              path: 'users',
              parent: BaseAdminRoute.name,
              children: [
                _i2.RouteConfig(AdminUserListRoute.name,
                    path: '', parent: AdminUsersRoutes.name)
              ])
        ]),
        _i2.RouteConfig(BaseRoute.name, path: '/', children: [
          _i2.RouteConfig(ExploreRoute.name,
              path: 'explore', parent: BaseRoute.name),
          _i2.RouteConfig(ArticlesRoutes.name,
              path: 'articles',
              parent: BaseRoute.name,
              children: [
                _i2.RouteConfig(ArticleListRoute.name,
                    path: '', parent: ArticlesRoutes.name),
                _i2.RouteConfig(ArticleDetailsRoute.name,
                    path: ':id', parent: ArticlesRoutes.name)
              ]),
          _i2.RouteConfig(SettingsRoutes.name,
              path: 'settings',
              parent: BaseRoute.name,
              children: [
                _i2.RouteConfig(SettingsRoute.name,
                    path: '', parent: SettingsRoutes.name),
                _i2.RouteConfig(FavoriteArticlesRoute.name,
                    path: 'favorite-articles', parent: SettingsRoutes.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.ProfileScreen]
class ProfileRoute extends _i2.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i2.EmptyRouterScreen]
class AuthRoutes extends _i2.PageRouteInfo<void> {
  const AuthRoutes({List<_i2.PageRouteInfo>? children})
      : super(AuthRoutes.name, path: '/auth', initialChildren: children);

  static const String name = 'AuthRoutes';
}

/// generated route for
/// [_i3.BaseAdminScreen]
class BaseAdminRoute extends _i2.PageRouteInfo<void> {
  const BaseAdminRoute({List<_i2.PageRouteInfo>? children})
      : super(BaseAdminRoute.name, path: '/admin', initialChildren: children);

  static const String name = 'BaseAdminRoute';
}

/// generated route for
/// [_i4.BaseScreen]
class BaseRoute extends _i2.PageRouteInfo<void> {
  const BaseRoute({List<_i2.PageRouteInfo>? children})
      : super(BaseRoute.name, path: '/', initialChildren: children);

  static const String name = 'BaseRoute';
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i2.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i16.Key? key})
      : super(LoginRoute.name, path: 'login', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.RegisterScreen]
class RegisterRoute extends _i2.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i16.Key? key})
      : super(RegisterRoute.name,
            path: 'register', args: RegisterRouteArgs(key: key));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.EmptyRouterPage]
class AdminArticlesRoutes extends _i2.PageRouteInfo<void> {
  const AdminArticlesRoutes({List<_i2.PageRouteInfo>? children})
      : super(AdminArticlesRoutes.name,
            path: 'articles', initialChildren: children);

  static const String name = 'AdminArticlesRoutes';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class AdminUsersRoutes extends _i2.PageRouteInfo<void> {
  const AdminUsersRoutes({List<_i2.PageRouteInfo>? children})
      : super(AdminUsersRoutes.name, path: 'users', initialChildren: children);

  static const String name = 'AdminUsersRoutes';
}

/// generated route for
/// [_i7.AdminArticleListScreen]
class AdminArticleListRoute extends _i2.PageRouteInfo<void> {
  const AdminArticleListRoute() : super(AdminArticleListRoute.name, path: '');

  static const String name = 'AdminArticleListRoute';
}

/// generated route for
/// [_i8.CreateArticleScreen]
class CreateArticleRoute extends _i2.PageRouteInfo<CreateArticleRouteArgs> {
  CreateArticleRoute({_i16.Key? key})
      : super(CreateArticleRoute.name,
            path: 'new', args: CreateArticleRouteArgs(key: key));

  static const String name = 'CreateArticleRoute';
}

class CreateArticleRouteArgs {
  const CreateArticleRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'CreateArticleRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.UpdateArticleScreen]
class UpdateArticleRoute extends _i2.PageRouteInfo<UpdateArticleRouteArgs> {
  UpdateArticleRoute({_i16.Key? key, required int id})
      : super(UpdateArticleRoute.name,
            path: ':id/edit',
            args: UpdateArticleRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'UpdateArticleRoute';
}

class UpdateArticleRouteArgs {
  const UpdateArticleRouteArgs({this.key, required this.id});

  final _i16.Key? key;

  final int id;

  @override
  String toString() {
    return 'UpdateArticleRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i10.AdminUserListScreen]
class AdminUserListRoute extends _i2.PageRouteInfo<void> {
  const AdminUserListRoute() : super(AdminUserListRoute.name, path: '');

  static const String name = 'AdminUserListRoute';
}

/// generated route for
/// [_i11.ExploreScreen]
class ExploreRoute extends _i2.PageRouteInfo<void> {
  const ExploreRoute() : super(ExploreRoute.name, path: 'explore');

  static const String name = 'ExploreRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class ArticlesRoutes extends _i2.PageRouteInfo<void> {
  const ArticlesRoutes({List<_i2.PageRouteInfo>? children})
      : super(ArticlesRoutes.name, path: 'articles', initialChildren: children);

  static const String name = 'ArticlesRoutes';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class SettingsRoutes extends _i2.PageRouteInfo<void> {
  const SettingsRoutes({List<_i2.PageRouteInfo>? children})
      : super(SettingsRoutes.name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRoutes';
}

/// generated route for
/// [_i12.ArticleListScreen]
class ArticleListRoute extends _i2.PageRouteInfo<void> {
  const ArticleListRoute() : super(ArticleListRoute.name, path: '');

  static const String name = 'ArticleListRoute';
}

/// generated route for
/// [_i13.ArticleDetailsScreen]
class ArticleDetailsRoute extends _i2.PageRouteInfo<ArticleDetailsRouteArgs> {
  ArticleDetailsRoute({_i16.Key? key, required int id})
      : super(ArticleDetailsRoute.name,
            path: ':id',
            args: ArticleDetailsRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'ArticleDetailsRoute';
}

class ArticleDetailsRouteArgs {
  const ArticleDetailsRouteArgs({this.key, required this.id});

  final _i16.Key? key;

  final int id;

  @override
  String toString() {
    return 'ArticleDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i14.SettingsScreen]
class SettingsRoute extends _i2.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i15.FavoriteArticlesScreen]
class FavoriteArticlesRoute extends _i2.PageRouteInfo<void> {
  const FavoriteArticlesRoute()
      : super(FavoriteArticlesRoute.name, path: 'favorite-articles');

  static const String name = 'FavoriteArticlesRoute';
}

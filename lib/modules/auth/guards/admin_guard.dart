import 'package:auto_route/auto_route.dart';
import 'package:enterprise_flutter/modules/auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final context = router.navigatorKey.currentContext!;
    final role = context.read<AuthProvider>().profile?.role;

    if (role == null) return resolver.next(false);

    if (role.isAdmin || role.isEditor) {
      resolver.next(true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You are not allow to access this page'),
        ),
      );
      router.navigateBack();
    }
  }
}

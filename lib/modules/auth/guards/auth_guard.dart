import 'package:auto_route/auto_route.dart';
import 'package:enterprise_flutter/modules/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final context = router.navigatorKey.currentContext!;
    final isAuthenticated = context.read<AuthProvider>().isAuthenticated;

    if (isAuthenticated) {
      resolver.next(true);
    } else {
      router.navigateNamed('/auth/login');
    }
  }
}

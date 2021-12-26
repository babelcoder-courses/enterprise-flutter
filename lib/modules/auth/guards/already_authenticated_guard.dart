import 'package:auto_route/auto_route.dart';
import 'package:enterprise_flutter/modules/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AlreadyAuthenticatedGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final context = router.navigatorKey.currentContext!;
    final isAuthenticated = context.read<AuthProvider>().isAuthenticated;

    if (isAuthenticated) {
      router.navigateNamed('/profile');
    } else {
      resolver.next(true);
    }
  }
}

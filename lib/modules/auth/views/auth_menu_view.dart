import 'package:enterprise_flutter/modules/auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';

class AuthMenuView extends StatelessWidget {
  const AuthMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<AuthProvider>().profile;

    if (profile == null) {
      return IconButton(
        onPressed: () => context.router.navigateNamed('/auth'),
        icon: const Icon(Icons.person),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => context.router.navigateNamed('/profile'),
        child: CircleAvatar(
          backgroundImage: NetworkImage(profile.avatar),
        ),
      ),
    );
  }
}

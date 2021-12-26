import 'package:enterprise_flutter/modules/auth/providers/auth_provider.dart';
import 'package:enterprise_flutter/modules/auth/views/edit_profile_form_view.dart';
import 'package:enterprise_flutter/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<AuthProvider>().profile;

    if (profile == null) {
      return const Center(
        child: Text('No Profile Found'),
      );
    }

    final role = profile.role;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            EditProfileForm(),
            if (role.isAdmin || role.isEditor)
              OutlinedButton(
                onPressed: () => context.router.replace(const BaseAdminRoute()),
                child: const Text('Admin Portal'),
              ),
            OutlinedButton(
              onPressed: () {
                context.router.navigateNamed('/');
                context.read<AuthProvider>().logout();
              },
              child: const Text('Logout'),
              style: OutlinedButton.styleFrom(
                primary: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

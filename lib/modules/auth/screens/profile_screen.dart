import 'package:auto_route/auto_route.dart';
import 'package:enterprise_flutter/modules/auth/providers/auth_provider.dart';
import 'package:enterprise_flutter/modules/auth/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello ${context.watch<AuthProvider>().profile?.name}'),
        leading: const AutoBackButton(),
      ),
      body: const ProfileView(),
    );
  }
}

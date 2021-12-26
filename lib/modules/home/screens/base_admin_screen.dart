import 'package:auto_route/auto_route.dart';
import 'package:enterprise_flutter/routes/router.gr.dart';
import 'package:flutter/material.dart';

class BaseAdminScreen extends StatelessWidget {
  const BaseAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
        leading: const AutoBackButton(),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Articles'),
              leading: const Icon(Icons.article),
              onTap: () {
                context.router.replace(const AdminArticlesRoutes());
                context.router.pop();
              },
            ),
            ListTile(
              title: const Text('Users'),
              leading: const Icon(Icons.person),
              onTap: () {
                context.router.replace(const AdminUsersRoutes());
                context.router.pop();
              },
            ),
          ],
        ),
      ),
      body: const AutoRouter(),
    );
  }
}

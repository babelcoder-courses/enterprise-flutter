import 'package:auto_route/auto_route.dart';
import 'package:enterprise_flutter/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          title: const Text(
            'Articles App',
          ),
          leading: const AutoBackButton(),
          centerTitle: true,
        );
      },
      routes: const [
        ExploreRoute(),
        ArticlesRoutes(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return SafeArea(
          child: SalomonBottomBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(
                  Icons.explore,
                  size: 30,
                ),
                title: const Text(
                  'Explore',
                ),
              ),
              SalomonBottomBarItem(
                icon: const Icon(
                  Icons.article,
                  size: 30,
                ),
                title: const Text(
                  'Articles',
                ),
              ),
              SalomonBottomBarItem(
                icon: const Icon(
                  Icons.settings,
                  size: 30,
                ),
                title: const Text(
                  'Settings',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

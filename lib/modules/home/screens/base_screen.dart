import 'package:auto_route/auto_route.dart';
import 'package:enterprise_flutter/modules/shared/articles_theme.dart';
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
          title: Text(
            'Articles App',
            style: ArticlesTheme.dark().textTheme.subtitle1,
          ),
          leading: const AutoBackButton(),
        );
      },
      routes: const [
        ExploreRoute(),
        ArticlesRoutes(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        final buttonStyle = ArticlesTheme.dark()
            .textTheme
            .button
            ?.copyWith(color: ArticlesTheme.dark().primaryColor);

        return SafeArea(
          child: SalomonBottomBar(
            selectedItemColor:
                ArticlesTheme.dark().bottomNavigationBarTheme.selectedItemColor,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(
                  Icons.explore,
                  size: 30,
                ),
                title: Text(
                  'Explore',
                  style: buttonStyle,
                ),
              ),
              SalomonBottomBarItem(
                icon: const Icon(
                  Icons.article,
                  size: 30,
                ),
                title: Text(
                  'Articles',
                  style: buttonStyle,
                ),
              ),
              SalomonBottomBarItem(
                icon: const Icon(
                  Icons.settings,
                  size: 30,
                ),
                title: Text(
                  'Settings',
                  style: buttonStyle,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

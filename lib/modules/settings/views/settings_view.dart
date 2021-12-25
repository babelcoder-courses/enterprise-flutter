import 'package:enterprise_flutter/modules/settings/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settings, child) {
        return SettingsList(
          sections: [
            SettingsSection(
              title: 'Theme',
              tiles: [
                SettingsTile.switchTile(
                  title: 'Dark Mode',
                  leading: const Icon(Icons.dark_mode),
                  switchValue: settings.darkMode,
                  onToggle: (value) => settings.darkMode = value,
                ),
              ],
            ),
            SettingsSection(
              title: 'Articles',
              tiles: [
                SettingsTile(
                  title: 'Favorite Articles',
                  leading: const Icon(Icons.favorite),
                  onPressed: (context) => context.router
                      .navigateNamed('/settings/favorite-articles'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

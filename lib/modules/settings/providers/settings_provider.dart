import 'package:enterprise_flutter/modules/shared/articles_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsProvider extends ChangeNotifier {
  final _settings = Hive.box('settings');

  bool get darkMode {
    return _settings.get(
      'darkMode',
      defaultValue: ThemeMode.system == ThemeMode.dark,
    );
  }

  bool get intro {
    return _settings.get(
      'intro',
      defaultValue: false,
    );
  }

  ThemeData get theme {
    return darkMode ? ArticlesTheme.dark() : ArticlesTheme.light();
  }

  set darkMode(bool mode) {
    _settings.put('darkMode', mode);
    notifyListeners();
  }

  set intro(bool intro) {
    _settings.put('intro', intro);
    notifyListeners();
  }
}

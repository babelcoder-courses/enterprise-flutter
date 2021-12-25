import 'package:enterprise_flutter/modules/shared/articles_theme.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool _darkMode = false;

  bool get darkMode => _darkMode;

  set darkMode(bool isDarkMode) {
    _darkMode = isDarkMode;
    notifyListeners();
  }

  ThemeData get theme {
    return darkMode ? ArticlesTheme.dark() : ArticlesTheme.light();
  }
}

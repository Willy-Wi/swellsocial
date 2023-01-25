import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider({bool? darkMode}) {
    if (darkMode == null) return;
    _themeMode = darkMode ? ThemeMode.dark : ThemeMode.light;
  }

  ThemeMode _themeMode = ThemeMode.light;

  bool get isDarkMode => _themeMode == ThemeMode.light ? false : true;

  Future<void> swapTheme() async {
    final prefs = await SharedPreferences.getInstance();

    if (_themeMode == ThemeMode.light) {
      prefs.setBool('darkMode', true);
      _themeMode = ThemeMode.dark;
    } else {
      prefs.setBool('darkMode', false);
      _themeMode = ThemeMode.light;
    }

    notifyListeners();
  }
}

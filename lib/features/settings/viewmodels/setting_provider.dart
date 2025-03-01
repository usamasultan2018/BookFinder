import 'package:flutter/material.dart';
import 'package:bookfinder/core/utils/theme_preference.dart';

class SettingProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  final ThemePreference _themePreference = ThemePreference();

  SettingProvider() {
    _loadTheme(); 
  }

  void toggleTheme(bool? value) {
    _isDarkMode = value ?? !_isDarkMode;
    notifyListeners();
    _themePreference.setTheme(_isDarkMode);
  }

  Future<void> _loadTheme() async {
    _isDarkMode = await _themePreference.getTheme();
    notifyListeners();
  }
}

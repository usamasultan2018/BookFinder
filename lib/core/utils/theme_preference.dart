import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const String _key = 'isDarkTheme';

  Future<void> setTheme(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDarkMode);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false; // Default to light mode
  }
}

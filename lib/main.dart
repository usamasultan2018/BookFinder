import 'package:bookfinder/core/database/database_helper.dart';
import 'package:bookfinder/core/navigation/app_router.dart';
import 'package:bookfinder/features/favorites/viewmodels/favorite_book_provider.dart';
import 'package:bookfinder/features/settings/viewmodels/setting_provider.dart';
import 'package:bookfinder/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().database;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => SettingProvider()),
      ],
      child: Consumer<SettingProvider>(
          builder: (BuildContext context, value, Widget? child) {
        return MaterialApp.router(
          title: 'Book Finder',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: value.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}

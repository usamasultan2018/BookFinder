import 'package:bookfinder/core/models/book.dart';
import 'package:bookfinder/features/book_details/views/book_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes_names.dart';
import '../../features/splash/views/splash_screen.dart';
import '../../features/home/views/home_screen.dart';
import '../../features/favorites/views/favorites_screen.dart';
import '../../features/settings/views/settings_screen.dart';
import '../../features/home/widgets/bottom_nav_bar.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RoutesNames.splash,
    routes: [
      GoRoute(
        path: RoutesNames.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RoutesNames.bottomNav,
        name: 'bottomNav',
        builder: (context, state) => const BottomNavBar(),
      ),
      GoRoute(
        path: RoutesNames.home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RoutesNames.favorites,
        name: 'favorites',
        builder: (context, state) => const FavoritesScreen(),
      ),
      GoRoute(
        path: RoutesNames.bookDetails,
        name: 'details',
        builder: (context, state) {
          final book = state.extra as Book; // Retrieve the full book object
          return BookDetailScreen(
            book: book,
          );
        },
      ),
      GoRoute(
        path: RoutesNames.settings,
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text('Page Not Found')),
    ),
  );
}

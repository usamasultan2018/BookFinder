import 'package:bookfinder/features/favorites/views/favorites_screen.dart';
import 'package:bookfinder/features/home/views/home_screen.dart';
import 'package:bookfinder/features/settings/views/settings_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = const [
    HomeScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: theme.colorScheme.background,
        indicatorColor: theme.colorScheme.primary.withOpacity(0.2),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.favorite,
              color: _selectedIndex == 1
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
            ),
            label: "Favorites",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.settings,
              color: _selectedIndex == 2
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
            ),
            label: "Settings",
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
    );
  }
}

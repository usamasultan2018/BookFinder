import 'package:bookfinder/features/settings/viewmodels/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<SettingProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return SwitchListTile(
                    title: Text(
                      "Dark Mode",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    value: value.isDarkMode,
                    onChanged: (values) {
                      value.toggleTheme(values);
                    },
                    activeColor: Theme.of(context).colorScheme.primary,

                    tileColor: Theme.of(context).cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

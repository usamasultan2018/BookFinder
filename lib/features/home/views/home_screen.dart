import 'package:bookfinder/features/home/viewmodel/book_provider.dart';
import 'package:bookfinder/features/home/widgets/all_book_grid.dart';
import 'package:bookfinder/features/home/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookProvider(), // Ensures BookProvider is available
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Home',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 15),

                /// 📌 Search Description
                Text(
                  'Search for books by title, author, or genre to find your next read.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),

                const SearchFieldWidget(),
                const SizedBox(height: 16),
                const Expanded(child: AllBookGrid()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

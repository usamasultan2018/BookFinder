import 'package:bookfinder/features/home/viewmodel/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(
      builder: (context, bookProvider, child) {
        return TextField(
          controller: bookProvider.controller,
          onChanged: (query) => bookProvider.searchBooks(query),
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: bookProvider.controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.close, size: 20),
                    onPressed: bookProvider.clearSearch,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        );
      },
    );
  }
}

import 'package:bookfinder/core/navigation/routes_names.dart';
import 'package:bookfinder/features/home/viewmodel/book_provider.dart';
import 'package:bookfinder/shared/widgets/book_card.dart';
import 'package:bookfinder/shared/widgets/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AllBookGrid extends StatelessWidget {
  const AllBookGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(
      builder: (context, bookProvider, child) {
        if (bookProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (bookProvider.books.isEmpty) {
          return const EmptyStateWidget(message: "No books available");
        }

        return GridView.builder(
          padding: const EdgeInsets.only(bottom: 20),
          itemCount: bookProvider.books.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: .6,
          ),
          itemBuilder: (context, index) {
            final book = bookProvider.books[index];
            return BookCard(
              book: book,
              onTap: () {
                context.push(RoutesNames.bookDetails, extra: book);
              },
            );
          },
        );
      },
    );
  }
}

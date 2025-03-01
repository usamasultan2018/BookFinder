import 'package:bookfinder/core/navigation/routes_names.dart';
import 'package:bookfinder/features/favorites/viewmodels/favorite_book_provider.dart';
import 'package:bookfinder/shared/widgets/book_card.dart';
import 'package:bookfinder/shared/widgets/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FavoriteGridBooks extends StatelessWidget {
  const FavoriteGridBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final favorites = favoritesProvider.favorites;

        return favorites.isEmpty
            ? EmptyStateWidget(message: "No favorite yet!")
            : Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: .55,
                  ),
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return BookCard(
                      book: favorites[index],
                      onTap: () {
                        context.push(
                          RoutesNames.bookDetails,
                          extra: favorites[index],
                        );
                      },
                    );
                  },
                ),
              );
      },
    );
  }
}

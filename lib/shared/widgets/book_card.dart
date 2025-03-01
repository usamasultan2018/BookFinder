import 'package:bookfinder/core/models/book.dart';
import 'package:bookfinder/features/favorites/viewmodels/favorite_book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookCard({
    super.key,
    required this.book,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 3 / 3.5,
                    child: FadeInImage.assetNetwork(
                      placeholder:
                          'assets/place-holder.webp',
                      image: book.thumbnail,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Container(
                        color: Colors.grey.shade300,
                        alignment: Alignment.center,
                        child: const Icon(Icons.broken_image, size: 50),
                      ),
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 8,
                    right: 8,
                    child: Consumer<FavoritesProvider>(
                      builder: (context, favoritesProvider, child) {
                        final isFavorite =
                            favoritesProvider.isFavorite(book.id);
                        return GestureDetector(
                          onTap: () {
                            favoritesProvider.toggleFavorite(book);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.5),
                            radius: 18,
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Text(
              book.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),

            if (book.subtitle.isNotEmpty)
              Text(
                book.subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

            const SizedBox(height: 8),

            /// 📌 Publisher Name
            Text(
              book.publisher,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade500,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

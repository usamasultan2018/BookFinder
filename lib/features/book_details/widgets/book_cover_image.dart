import 'package:bookfinder/core/models/book.dart';
import 'package:flutter/material.dart';

class BookCoverImage extends StatelessWidget {
  final Book book;

  const BookCoverImage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    // Check if the thumbnail is not empty or null
    final imageUrl = (book.thumbnail != null && book.thumbnail!.isNotEmpty) 
        ? book.thumbnail 
        : null; // Or use a placeholder URL

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: imageUrl != null
            ? Image.network(
                imageUrl,
                width: 180,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _buildErrorContainer(),
              )
            : _buildErrorContainer(),
      ),
    );
  }

  // Fallback container when image is not available
  Widget _buildErrorContainer() {
    return Container(
      width: 180,
      height: 250,
      color: Colors.grey.shade300,
      alignment: Alignment.center,
      child: const Icon(Icons.broken_image, size: 50),
    );
  }
}

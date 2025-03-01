import 'package:bookfinder/core/models/book.dart';
import 'package:flutter/material.dart';

class BookDescription extends StatelessWidget {
  final Book book;

  const BookDescription({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          book.description!.isNotEmpty
              ? book.description!
              : "No description available.",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

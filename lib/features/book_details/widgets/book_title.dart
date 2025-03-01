import 'package:bookfinder/core/models/book.dart';
import 'package:flutter/material.dart';

class BookTitle extends StatelessWidget {
  final Book book;

  const BookTitle({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          book.title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        if (book.subtitle!.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(
            book.subtitle!,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}

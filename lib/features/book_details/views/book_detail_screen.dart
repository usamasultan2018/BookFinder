import 'package:bookfinder/core/models/book.dart';
import 'package:bookfinder/features/book_details/widgets/book_cover_image.dart';
import 'package:bookfinder/features/book_details/widgets/book_description.dart';
import 'package:bookfinder/features/book_details/widgets/book_detail_row.dart';
import 'package:bookfinder/features/book_details/widgets/book_title.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BookCoverImage(book: book),
            const SizedBox(height: 20),
            BookTitle(book: book),
            const SizedBox(height: 16),
            BookDetailRow(
                label: "Publisher", value: book.publisher ?? "Unknown"),
            const SizedBox(height: 20),
            BookDescription(book: book),
            const SizedBox(height: 30),
            _buildLinkButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkButton() {
    return ElevatedButton(
      onPressed: () async {
        final Uri url = Uri.parse(book.previewLink ?? "");
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          debugPrint("Could not launch ${book.previewLink}");
        }
      },
      child: const Text("Read More"),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Book Details",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
      elevation: 0,
    );
  }
}

import 'package:flutter/material.dart';

class BookDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const BookDetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return value.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(value, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
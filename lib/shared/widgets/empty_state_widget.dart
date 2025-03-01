import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;
  final IconData icon;

  const EmptyStateWidget({
    super.key,
    required this.message,
    this.icon = Icons.book,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
            ),
            const SizedBox(height: 10),
            Text(
              message,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

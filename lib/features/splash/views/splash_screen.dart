import 'package:bookfinder/core/navigation/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go(RoutesNames.bottomNav);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeIn(
          duration: const Duration(seconds: 2),
          child: const Text(
            'Book Finder',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToDashboard();
  }

  Future<void> _navigateToDashboard() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.go('/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ZoomIn(
              duration: const Duration(milliseconds: 800),
              child: Icon(Icons.wb_sunny,
                  size: 80, color: theme.colorScheme.primary),
            ),
            const SizedBox(height: 24),
            FadeIn(
              delay: const Duration(milliseconds: 400),
              duration: const Duration(milliseconds: 600),
              child: Text(
                  'Kuwait Weather', style: theme.textTheme.headlineMedium),
            ),
            const SizedBox(height: 16),
            FadeIn(
              delay: const Duration(milliseconds: 800),
              child: const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}

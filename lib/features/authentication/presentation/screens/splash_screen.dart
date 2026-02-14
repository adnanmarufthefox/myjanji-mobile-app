import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import 'package:myjanji/app_router.dart';

/// Splash screen shown on app startup
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(currentUserProvider, (previous, next) {
      // Navigate based on user state
      Future.delayed(const Duration(seconds: 2), () {
        if (!context.mounted) return;
        if (next != null) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.dashboard);
        } else {
          Navigator.of(context).pushReplacementNamed(AppRoutes.login);
        }
      });
    });

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: Replace with actual logo
            Icon(
              Icons.security,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 24),
            Text(
              'MyJanji',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Secure Verification Platform',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
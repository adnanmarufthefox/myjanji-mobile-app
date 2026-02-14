import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/di/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize service locator for dependency injection
  setupServiceLocator();

  runApp(const ProviderScope(child: MyJanjiApp()));
}

class MyJanjiApp extends StatelessWidget {
  const MyJanjiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyJanji',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splash,
      routes: appRoutes,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
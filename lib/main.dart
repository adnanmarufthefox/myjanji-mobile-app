import 'package:flutter/material.dart';
import 'core/di/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize service locator for dependency injection
  setupServiceLocator();

  runApp(const MyJanjiApp());
}

class MyJanjiApp extends StatelessWidget {
  const MyJanjiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyJanji',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      routes: appRoutes,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
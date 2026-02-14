import 'package:flutter/material.dart';
import 'features/authentication/providers/screens/login_screen.dart';
import 'features/authentication/providers/screens/splash_screen.dart';
import 'features/dashboard/providers/screens/dashboard_screen.dart';
import 'features/verification/mykad/providers/screens/mykad_verification_screen.dart';
import 'features/verification/face/providers/screens/face_verification_screen.dart';
import 'features/contracts/providers/screens/contracts_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String myKadVerification = '/verification/mykad';
  static const String faceVerification = '/verification/face';
  static const String contracts = '/contracts';
}

final Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.splash: (_) => const SplashScreen(),
  AppRoutes.login: (_) => const LoginScreen(),
  AppRoutes.dashboard: (_) => const DashboardScreen(),
  AppRoutes.myKadVerification: (_) => const MyKadVerificationScreen(),
  AppRoutes.faceVerification: (_) => const FaceVerificationScreen(),
  AppRoutes.contracts: (_) => const ContractsScreen(),
};

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _buildRoute(const SplashScreen(), settings);
      case AppRoutes.login:
        return _buildRoute(const LoginScreen(), settings);
      case AppRoutes.dashboard:
        return _buildRoute(const DashboardScreen(), settings);
      case AppRoutes.myKadVerification:
        return _buildRoute(const MyKadVerificationScreen(), settings);
      case AppRoutes.faceVerification:
        return _buildRoute(const FaceVerificationScreen(), settings);
      case AppRoutes.contracts:
        return _buildRoute(const ContractsScreen(), settings);
      default:
        return _buildRoute(const SplashScreen(), settings);
    }
  }

  static MaterialPageRoute<dynamic> _buildRoute(
      Widget page,
      RouteSettings settings,
      ) {
    return MaterialPageRoute(
      builder: (_) => page,
      settings: settings,
    );
  }
}
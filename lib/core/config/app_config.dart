/// Application configuration constants
class AppConfig {
  // API Configuration
  // TODO: Add API endpoints when backend is ready
  static const String apiBaseUrl = 'https://api.myjanji.com';
  static const String apiVersion = '/v1';
  static const Duration apiTimeout = Duration(seconds: 30);

  // App Configuration
  static const String appName = 'MyJanji';
  static const String appVersion = '1.0.0';
  static const int androidMinSdkVersion = 24;

  // Feature Flags
  static const bool enableOfflineMode = true;
  static const bool enableAnalytics = true;

  // Validation Rules
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 50;
  static const int myKadLength = 12;
}
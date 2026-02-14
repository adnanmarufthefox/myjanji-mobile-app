/// Application-wide constants
class AppConstants {
  // API Related
  static const int apiRetryAttempts = 3;
  static const Duration apiRetryDelay = Duration(seconds: 2);

  // UI Related
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 8.0;
  static const double defaultElevation = 2.0;

  // Animation Durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 300);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 500);
  static const Duration longAnimationDuration = Duration(milliseconds: 1000);

  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';
  static const String verificationStatusKey = 'verification_status';
}
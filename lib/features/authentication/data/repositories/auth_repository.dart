import 'package:myjanji/core/utils/logger.dart';
import 'auth_service.dart';
import '../models/user_model.dart';
import '../models/login_request.dart';

/// Authentication repository that abstracts the data source
class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  /// Login user
  Future<UserModel> login(LoginRequest request) async {
    try {
      Logger.info('AuthRepository: Attempting login');
      final user = await _authService.login(request);
      Logger.info('AuthRepository: Login successful');
      return user;
    } catch (e) {
      Logger.error('AuthRepository: Login failed', e);
      rethrow;
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      Logger.info('AuthRepository: Attempting logout');
      await _authService.logout();
      Logger.info('AuthRepository: Logout successful');
    } catch (e) {
      Logger.error('AuthRepository: Logout failed', e);
      rethrow;
    }
  }

  /// Signup new user
  Future<UserModel> signup({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      Logger.info('AuthRepository: Attempting signup');
      final user = await _authService.signup(
        email: email,
        password: password,
        fullName: fullName,
      );
      Logger.info('AuthRepository: Signup successful');
      return user;
    } catch (e) {
      Logger.error('AuthRepository: Signup failed', e);
      rethrow;
    }
  }

  /// Refresh authentication token
  Future<String> refreshToken() async {
    try {
      Logger.info('AuthRepository: Refreshing token');
      return await _authService.refreshToken();
    } catch (e) {
      Logger.error('AuthRepository: Token refresh failed', e);
      rethrow;
    }
  }

  /// Get current user
  Future<UserModel?> getCurrentUser() async {
    try {
      Logger.info('AuthRepository: Fetching current user');
      return await _authService.getCurrentUser();
    } catch (e) {
      Logger.error('AuthRepository: Failed to fetch current user', e);
      return null;
    }
  }
}
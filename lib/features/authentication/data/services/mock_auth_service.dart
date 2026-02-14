import 'package:myjanji/core/utils/logger.dart';
import 'auth_service.dart';
import '../models/user_model.dart';
import '../models/login_request.dart';

/// Mock authentication service for frontend development
class MockAuthService implements AuthService {
  @override
  Future<UserModel> login(LoginRequest request) async {
    Logger.info('Mock login called with email: ${request.email}');

    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));

    // Mock validation
    if (request.email.isEmpty || request.password.isEmpty) {
      throw Exception('Email and password are required');
    }

    // Return mock user
    return UserModel(
      id: '1',
      email: request.email,
      fullName: 'John Doe',
      profilePictureUrl: 'https://via.placeholder.com/150',
      isVerified: false,
      createdAt: DateTime.now(),
    );
  }

  @override
  Future<void> logout() async {
    Logger.info('Mock logout called');
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<UserModel> signup({
    required String email,
    required String password,
    required String fullName,
  }) async {
    Logger.info('Mock signup called with email: $email');
    await Future.delayed(const Duration(seconds: 2));

    return UserModel(
      id: '1',
      email: email,
      fullName: fullName,
      isVerified: false,
      createdAt: DateTime.now(),
    );
  }

  @override
  Future<String> refreshToken() async {
    Logger.info('Mock token refresh called');
    await Future.delayed(const Duration(seconds: 1));
    return 'mock_token_${DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    Logger.info('Mock getCurrentUser called');
    await Future.delayed(const Duration(seconds: 1));

    return UserModel(
      id: '1',
      email: 'user@example.com',
      fullName: 'John Doe',
      isVerified: false,
      createdAt: DateTime.now(),
    );
  }
}
import '../models/user_model.dart';
import '../models/login_request.dart';

/// Abstract authentication service
abstract class AuthService {
  /// TODO: Implement real login API call when backend is ready
  Future<UserModel> login(LoginRequest request);

  /// TODO: Implement real logout API call when backend is ready
  Future<void> logout();

  /// TODO: Implement real signup API call when backend is ready
  Future<UserModel> signup({
    required String email,
    required String password,
    required String fullName,
  });

  /// TODO: Implement real token refresh when backend is ready
  Future<String> refreshToken();

  /// TODO: Implement real current user fetch when backend is ready
  Future<UserModel?> getCurrentUser();
}
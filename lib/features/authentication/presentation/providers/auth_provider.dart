import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/models/user_model.dart';
import '../../data/models/login_request.dart';
import 'package:myjanji/core/di/service_locator.dart';

// Provider for authentication repository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return getIt<AuthRepository>();
});

// Provider for current user
final currentUserProvider = StateNotifierProvider<CurrentUserNotifier, UserModel?>(
      (ref) {
    final repository = ref.watch(authRepositoryProvider);
    return CurrentUserNotifier(repository);
  },
);

// Provider for auth state
final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
      (ref) {
    final repository = ref.watch(authRepositoryProvider);
    return AuthStateNotifier(repository);
  },
);

/// Authentication state
enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState {
  final AuthStatus status;
  final UserModel? user;
  final String? error;

  AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.error,
  });

  AuthState copyWith({
    AuthStatus? status,
    UserModel? user,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}

/// Auth state notifier for managing authentication state
class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;

  AuthStateNotifier(this._repository) : super(AuthState());

  /// Login user
  Future<void> login(LoginRequest request) async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final user = await _repository.login(request);
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        error: e.toString(),
      );
    }
  }

  /// Logout user
  Future<void> logout() async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      await _repository.logout();
      state = AuthState(status: AuthStatus.unauthenticated);
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        error: e.toString(),
      );
    }
  }

  /// Signup new user
  Future<void> signup({
    required String email,
    required String password,
    required String fullName,
  }) async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final user = await _repository.signup(
        email: email,
        password: password,
        fullName: fullName,
      );
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        error: e.toString(),
      );
    }
  }
}

/// Current user notifier
class CurrentUserNotifier extends StateNotifier<UserModel?> {
  final AuthRepository _repository;

  CurrentUserNotifier(this._repository) : super(null) {
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    try {
      final user = await _repository.getCurrentUser();
      state = user;
    } catch (e) {
      state = null;
    }
  }
}
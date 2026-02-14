import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/mykad_repository.dart';
import '../../data/models/mykad_model.dart';
import 'package:myjanji/core/di/service_locator.dart';

// Provider for MyKad repository
final myKadRepositoryProvider = Provider<MyKadRepository>((ref) {
  return getIt<MyKadRepository>();
});

// Provider for MyKad verification state
final myKadStateProvider = StateNotifierProvider<MyKadStateNotifier, MyKadState>(
      (ref) {
    final repository = ref.watch(myKadRepositoryProvider);
    return MyKadStateNotifier(repository);
  },
);

/// MyKad verification state
class MyKadState {
  final bool isLoading;
  final MyKadModel? verificationData;
  final String? error;
  final bool isSubmitted;

  MyKadState({
    this.isLoading = false,
    this.verificationData,
    this.error,
    this.isSubmitted = false,
  });

  MyKadState copyWith({
    bool? isLoading,
    MyKadModel? verificationData,
    String? error,
    bool? isSubmitted,
  }) {
    return MyKadState(
      isLoading: isLoading ?? this.isLoading,
      verificationData: verificationData ?? this.verificationData,
      error: error ?? this.error,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }
}

/// MyKad state notifier
class MyKadStateNotifier extends StateNotifier<MyKadState> {
  final MyKadRepository _repository;

  MyKadStateNotifier(this._repository) : super(MyKadState());

  /// Submit MyKad verification
  Future<void> submitVerification({
    required String userId,
    required String imagePath,
    required String idNumber,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _repository.submitVerification(
        userId: userId,
        imagePath: imagePath,
        idNumber: idNumber,
      );
      state = state.copyWith(
        isLoading: false,
        verificationData: result,
        isSubmitted: true,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Get verification status
  Future<void> getVerificationStatus(String verificationId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _repository.getStatus(verificationId);
      state = state.copyWith(
        isLoading: false,
        verificationData: result,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Resubmit verification
  Future<void> resubmitVerification({
    required String verificationId,
    required String imagePath,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _repository.resubmit(
        verificationId: verificationId,
        imagePath: imagePath,
      );
      state = state.copyWith(
        isLoading: false,
        verificationData: result,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Reset state
  void reset() {
    state = MyKadState();
  }
}
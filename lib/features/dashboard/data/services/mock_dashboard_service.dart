import 'package:myjanji/core/utils/logger.dart';
import 'dashboard_service.dart';
import '../models/dashboard_model.dart';

/// Mock dashboard service for frontend development
class MockDashboardService implements DashboardService {
  @override
  Future<DashboardModel> getDashboardData(String userId) async {
    Logger.info('Mock getDashboardData called for user: $userId');
    await Future.delayed(const Duration(seconds: 1));

    return DashboardModel(
      userId: userId,
      userName: 'John Doe',
      verificationStatus: VerificationStatus.inProgress,
      completedSteps: 1,
      totalSteps: 3,
      lastUpdated: DateTime.now(),
    );
  }

  @override
  Future<void> updateDashboardStatus(
      String userId,
      VerificationStatus status,
      ) async {
    Logger.info(
      'Mock updateDashboardStatus called for user: $userId, status: ${status.name}',
    );
    await Future.delayed(const Duration(seconds: 1));
  }
}
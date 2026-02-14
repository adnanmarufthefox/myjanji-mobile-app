import '../models/dashboard_model.dart';

/// Abstract dashboard service
abstract class DashboardService {
  /// TODO: Implement real dashboard data fetch when backend is ready
  Future<DashboardModel> getDashboardData(String userId);

  /// TODO: Implement real dashboard update when backend is ready
  Future<void> updateDashboardStatus(String userId, VerificationStatus status);
}
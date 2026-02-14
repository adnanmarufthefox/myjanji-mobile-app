import 'package:myjanji/core/utils/logger.dart';
import '../services/dashboard_service.dart';
import '../models/dashboard_model.dart';

/// Dashboard repository
class DashboardRepository {
  final DashboardService _dashboardService;

  DashboardRepository(this._dashboardService);

  /// Get dashboard data
  Future<DashboardModel> getDashboardData(String userId) async {
    try {
      Logger.info('DashboardRepository: Fetching dashboard data');
      return await _dashboardService.getDashboardData(userId);
    } catch (e) {
      Logger.error('DashboardRepository: Failed to fetch dashboard data', e);
      rethrow;
    }
  }

  /// Update dashboard status
  Future<void> updateDashboardStatus(
      String userId,
      VerificationStatus status,
      ) async {
    try {
      Logger.info('DashboardRepository: Updating dashboard status');
      await _dashboardService.updateDashboardStatus(userId, status);
    } catch (e) {
      Logger.error('DashboardRepository: Failed to update dashboard', e);
      rethrow;
    }
  }
}
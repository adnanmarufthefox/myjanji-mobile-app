import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/dashboard_repository.dart';
import '../../data/models/dashboard_model.dart';
import 'package:myjanji/core/di/service_locator.dart';
import '../../../authentication/presentation/providers/auth_provider.dart';

// Provider for dashboard repository
final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return getIt<DashboardRepository>();
});

// Provider for dashboard data
final dashboardDataProvider = FutureProvider<DashboardModel?>((ref) async {
  final currentUser = ref.watch(currentUserProvider);

  if (currentUser == null) return null;

  final repository = ref.watch(dashboardRepositoryProvider);
  return repository.getDashboardData(currentUser.id);
});
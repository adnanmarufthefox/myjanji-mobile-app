import 'package:get_it/get_it.dart';
import '../../features/authentication/data/services/auth_service.dart';
import '../../features/authentication/data/services/mock_auth_service.dart';
import '../../features/authentication/data/repositories/auth_repository.dart';
import '../../features/verification/mykad/data/services/mykad_service.dart';
import '../../features/verification/mykad/data/services/mock_mykad_service.dart';
import '../../features/verification/mykad/data/repositories/mykad_repository.dart';
import '../../features/verification/face/data/services/face_service.dart';
import '../../features/verification/face/data/services/mock_face_service.dart';
import '../../features/verification/face/data/repositories/face_repository.dart';
import '../../features/contracts/data/services/contract_service.dart';
import '../../features/contracts/data/services/mock_contract_service.dart';
import '../../features/contracts/data/repositories/contract_repository.dart';
import '../../features/dashboard/data/services/dashboard_service.dart';
import '../../features/dashboard/data/services/mock_dashboard_service.dart';
import '../../features/dashboard/data/repositories/dashboard_repository.dart';

final getIt = GetIt.instance;

/// Setup dependency injection
/// This function initializes all services and repositories
void setupServiceLocator() {
  // Authentication Services
  getIt.registerSingleton<AuthService>(MockAuthService());
  getIt.registerSingleton<AuthRepository>(
    AuthRepository(getIt<AuthService>()),
  );

  // MyKad Verification Services
  getIt.registerSingleton<MyKadService>(MockMyKadService());
  getIt.registerSingleton<MyKadRepository>(
    MyKadRepository(getIt<MyKadService>()),
  );

  // Face Verification Services
  getIt.registerSingleton<FaceService>(MockFaceService());
  getIt.registerSingleton<FaceRepository>(
    FaceRepository(getIt<FaceService>()),
  );

  // Contract Services
  getIt.registerSingleton<ContractService>(MockContractService());
  getIt.registerSingleton<ContractRepository>(
    ContractRepository(getIt<ContractService>()),
  );

  // Dashboard Services
  getIt.registerSingleton<DashboardService>(MockDashboardService());
  getIt.registerSingleton<DashboardRepository>(
    DashboardRepository(getIt<DashboardService>()),
  );
}
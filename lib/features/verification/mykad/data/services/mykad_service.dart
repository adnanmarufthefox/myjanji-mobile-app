import '../models/mykad_model.dart';

/// Abstract MyKad verification service
abstract class MyKadService {
  /// TODO: Implement real MyKad upload and verification when backend is ready
  Future<MyKadModel> submitMyKadVerification({
    required String userId,
    required String imagePath,
    required String idNumber,
  });

  /// TODO: Implement real verification status check when backend is ready
  Future<MyKadModel> getVerificationStatus(String verificationId);

  /// TODO: Implement real verification resubmission when backend is ready
  Future<MyKadModel> resubmitVerification({
    required String verificationId,
    required String imagePath,
  });
}
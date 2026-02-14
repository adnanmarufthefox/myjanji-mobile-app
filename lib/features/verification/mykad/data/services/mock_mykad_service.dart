import 'package:myjanji/core/utils/logger.dart';
import 'mykad_service.dart';
import '../models/mykad_model.dart';

/// Mock MyKad verification service for frontend development
class MockMyKadService implements MyKadService {
  @override
  Future<MyKadModel> submitMyKadVerification({
    required String userId,
    required String imagePath,
    required String idNumber,
  }) async {
    Logger.info('Mock submitMyKadVerification called');
    Logger.info('User ID: $userId, Image Path: $imagePath, ID Number: $idNumber');

    await Future.delayed(const Duration(seconds: 2));

    return MyKadModel(
      verificationId: 'mykad_${DateTime.now().millisecondsSinceEpoch}',
      idNumber: idNumber,
      fullName: 'John Doe',
      dateOfBirth: DateTime(1990, 1, 1),
      address: '123 Jalan Merdeka, 50050 Kuala Lumpur',
      imageUrl: imagePath,
      status: MyKadStatus.submitted,
      submittedAt: DateTime.now(),
    );
  }

  @override
  Future<MyKadModel> getVerificationStatus(String verificationId) async {
    Logger.info('Mock getVerificationStatus called for: $verificationId');
    await Future.delayed(const Duration(seconds: 1));

    return MyKadModel(
      verificationId: verificationId,
      idNumber: '123456789012',
      fullName: 'John Doe',
      dateOfBirth: DateTime(1990, 1, 1),
      address: '123 Jalan Merdeka, 50050 Kuala Lumpur',
      imageUrl: '',
      status: MyKadStatus.verified,
      submittedAt: DateTime.now(),
    );
  }

  @override
  Future<MyKadModel> resubmitVerification({
    required String verificationId,
    required String imagePath,
  }) async {
    Logger.info('Mock resubmitVerification called for: $verificationId');
    await Future.delayed(const Duration(seconds: 2));

    return MyKadModel(
      verificationId: verificationId,
      idNumber: '123456789012',
      fullName: 'John Doe',
      dateOfBirth: DateTime(1990, 1, 1),
      address: '123 Jalan Merdeka, 50050 Kuala Lumpur',
      imageUrl: imagePath,
      status: MyKadStatus.submitted,
      submittedAt: DateTime.now(),
    );
  }
}
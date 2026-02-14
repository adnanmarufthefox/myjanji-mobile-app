import 'package:myjanji/core/utils/logger.dart';
import 'mykad_service.dart';
import '../models/mykad_model.dart';

/// MyKad verification repository
class MyKadRepository {
  final MyKadService _myKadService;

  MyKadRepository(this._myKadService);

  /// Submit MyKad verification
  Future<MyKadModel> submitVerification({
    required String userId,
    required String imagePath,
    required String idNumber,
  }) async {
    try {
      Logger.info('MyKadRepository: Submitting verification');
      return await _myKadService.submitMyKadVerification(
        userId: userId,
        imagePath: imagePath,
        idNumber: idNumber,
      );
    } catch (e) {
      Logger.error('MyKadRepository: Submission failed', e);
      rethrow;
    }
  }

  /// Get verification status
  Future<MyKadModel> getStatus(String verificationId) async {
    try {
      Logger.info('MyKadRepository: Fetching status');
      return await _myKadService.getVerificationStatus(verificationId);
    } catch (e) {
      Logger.error('MyKadRepository: Failed to fetch status', e);
      rethrow;
    }
  }

  /// Resubmit verification
  Future<MyKadModel> resubmit({
    required String verificationId,
    required String imagePath,
  }) async {
    try {
      Logger.info('MyKadRepository: Resubmitting verification');
      return await _myKadService.resubmitVerification(
        verificationId: verificationId,
        imagePath: imagePath,
      );
    } catch (e) {
      Logger.error('MyKadRepository: Resubmission failed', e);
      rethrow;
    }
  }
}
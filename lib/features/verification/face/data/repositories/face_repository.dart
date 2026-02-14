import 'package:myjanji/core/utils/logger.dart';
import '../services/face_service.dart';
import '../models/face_model.dart';

class FaceRepository {
  final FaceService _faceService;

  FaceRepository(this._faceService);

  Future<FaceModel> verifyFace({
    required String userId,
    required String imagePath,
  }) async {
    try {
      Logger.info('FaceRepository: Verifying face');
      return await _faceService.verifyFace(
        userId: userId,
        imagePath: imagePath,
      );
    } catch (e) {
      Logger.error('FaceRepository: Face verification failed', e);
      rethrow;
    }
  }
}

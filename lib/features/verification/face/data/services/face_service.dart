import '../models/face_model.dart';

abstract class FaceService {
  Future<FaceModel> verifyFace({
    required String userId,
    required String imagePath,
  });
}

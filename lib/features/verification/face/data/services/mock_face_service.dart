import 'face_service.dart';
import '../models/face_model.dart';

class MockFaceService implements FaceService {
  @override
  Future<FaceModel> verifyFace({
    required String userId,
    required String imagePath,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    return FaceModel(
      id: 'mock_face_id',
      status: 'verified',
      message: 'Face verification successful',
    );
  }
}

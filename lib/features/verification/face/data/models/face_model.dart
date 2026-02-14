class FaceModel {
  final String id;
  final String status;
  final String? message;

  FaceModel({
    required this.id,
    required this.status,
    this.message,
  });

  factory FaceModel.fromJson(Map<String, dynamic> json) {
    return FaceModel(
      id: json['id'] as String,
      status: json['status'] as String,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'message': message,
    };
  }
}

/// MyKad verification model
class MyKadModel {
  final String verificationId;
  final String idNumber;
  final String fullName;
  final DateTime dateOfBirth;
  final String address;
  final String imageUrl;
  final MyKadStatus status;
  final DateTime submittedAt;

  MyKadModel({
    required this.verificationId,
    required this.idNumber,
    required this.fullName,
    required this.dateOfBirth,
    required this.address,
    required this.imageUrl,
    required this.status,
    required this.submittedAt,
  });

  factory MyKadModel.fromJson(Map<String, dynamic> json) {
    return MyKadModel(
      verificationId: json['verificationId'] as String,
      idNumber: json['idNumber'] as String,
      fullName: json['fullName'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      address: json['address'] as String,
      imageUrl: json['imageUrl'] as String,
      status: MyKadStatus.values.firstWhere(
            (status) => status.name == json['status'],
        orElse: () => MyKadStatus.pending,
      ),
      submittedAt: DateTime.parse(json['submittedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'verificationId': verificationId,
    'idNumber': idNumber,
    'fullName': fullName,
    'dateOfBirth': dateOfBirth.toIso8601String(),
    'address': address,
    'imageUrl': imageUrl,
    'status': status.name,
    'submittedAt': submittedAt.toIso8601String(),
  };
}

/// MyKad verification status
enum MyKadStatus { pending, submitted, verified, rejected }
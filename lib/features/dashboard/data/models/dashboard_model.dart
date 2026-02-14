/// Dashboard data model
class DashboardModel {
  final String userId;
  final String userName;
  final VerificationStatus verificationStatus;
  final int completedSteps;
  final int totalSteps;
  final DateTime lastUpdated;

  DashboardModel({
    required this.userId,
    required this.userName,
    required this.verificationStatus,
    required this.completedSteps,
    required this.totalSteps,
    required this.lastUpdated,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      verificationStatus: VerificationStatus.values.firstWhere(
            (status) => status.name == json['verificationStatus'],
        orElse: () => VerificationStatus.pending,
      ),
      completedSteps: json['completedSteps'] as int? ?? 0,
      totalSteps: json['totalSteps'] as int? ?? 3,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'userName': userName,
    'verificationStatus': verificationStatus.name,
    'completedSteps': completedSteps,
    'totalSteps': totalSteps,
    'lastUpdated': lastUpdated.toIso8601String(),
  };
}

/// Verification status enum
enum VerificationStatus { pending, inProgress, verified, rejected }
class ContractModel {
  final String id;
  final String title;
  final String status;
  final DateTime signedDate;

  ContractModel({
    required this.id,
    required this.title,
    required this.status,
    required this.signedDate,
  });

  factory ContractModel.fromJson(Map<String, dynamic> json) {
    return ContractModel(
      id: json['id'] as String,
      title: json['title'] as String,
      status: json['status'] as String,
      signedDate: DateTime.parse(json['signedDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'status': status,
      'signedDate': signedDate.toIso8601String(),
    };
  }
}

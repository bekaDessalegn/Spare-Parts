class SQLiteModel {
  final String id;
  final String fullName;
  final String phone;
  final String email;
  final String passwordHash;
  final String defaultPlateNumber;

  SQLiteModel({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.passwordHash,
    required this.defaultPlateNumber
  });

  factory SQLiteModel.fromJson(Map<String, dynamic> json) => SQLiteModel(
    id: json['id'],
    fullName: json['fullName'],
    phone: json['phone'],
    email: json['email'],
    passwordHash: json['passwordHash'],
    defaultPlateNumber: json['defaultPlateNumber']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullName': fullName,
    'phone': phone,
    'email': email,
    'passwordHash': passwordHash,
    'defaultPlateNumber': defaultPlateNumber
  };
}
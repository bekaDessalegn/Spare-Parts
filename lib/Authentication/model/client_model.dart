class ClientModel{
  final String username;
  final String password;
  final String amount;

  ClientModel({required this.username, required this.password, required this.amount});

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      ClientModel(
          username: json['username'],
          password: json['password'],
        amount: json['amount']
      );

  Map<String, dynamic> toJson() => {
    'username' : username,
    'password' : password,
    'amount' : amount
  };
}
class LoginBlocModel{
  final String username;
  final String password;

  LoginBlocModel({required this.username, required this.password});

  factory LoginBlocModel.fromJson(Map<String, dynamic> json) =>
      LoginBlocModel(
          username: json['username'],
          password: json['password']
      );

  Map<String, dynamic> toJson() => {
    'username' : username,
    'password' : password
  };
}
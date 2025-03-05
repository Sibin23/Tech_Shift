class UserModel {
  final String userName;
  final String password;
  final String phoneNumber;

  UserModel(
      {required this.userName,
      required this.password,
      required this.phoneNumber});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json['name'],
        phoneNumber: json['phone'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'name': userName,
        'phone': phoneNumber,
        'password': password,
      };
}

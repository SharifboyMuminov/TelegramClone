class UserModel {
  final String id;
  final String userName;
  final String password;

  UserModel({
    required this.id,
    required this.password,
    required this.userName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] as String? ?? "",
      password: json["password"] as String? ?? "",
      userName: json["user_name"] as String? ?? "",
    );
  }

  UserModel copyWith({
    String? id,
    String? userName,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      password: password ?? this.password,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user_name": userName,
      "password": password,
    };
  }
}

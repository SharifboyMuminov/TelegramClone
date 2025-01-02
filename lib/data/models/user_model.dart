class UserModel {
  final String id;
  final String userName;
  final String userFullName;
  final String password;
  final String imageUrl;
  final String imagePath;

  UserModel({
    required this.id,
    required this.password,
    required this.userName,
    required this.userFullName,
    required this.imagePath,
    required this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] as String? ?? "",
      password: json["password"] as String? ?? "",
      userName: json["user_name"] as String? ?? "",
      imagePath: json["image_path"] as String? ?? "",
      imageUrl: json["image_url"] as String? ?? "",
      userFullName: json["user_ful_name"] as String? ?? "",
    );
  }

  UserModel copyWith({
    String? id,
    String? userName,
    String? password,
    String? imageUrl,
    String? imagePath,
    String? userFullName,
  }) {
    return UserModel(
      id: id ?? this.id,
      password: password ?? this.password,
      userName: userName ?? this.userName,
      imagePath: imagePath ?? this.imagePath,
      imageUrl: imageUrl ?? this.imageUrl,
      userFullName: userFullName ?? this.userFullName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user_name": userName,
      "password": password,
      "image_url": imageUrl,
      "image_path": imagePath,
      "user_ful_name": userFullName,
    };
  }

  factory UserModel.initial() {
    return UserModel(
      id: "",
      password: "",
      userName: "",
      imagePath: '',
      imageUrl: '',
      userFullName: '',
    );
  }
}

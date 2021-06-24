import 'dart:convert';

class UserModel {
  final String name;
  final String? photoUrl;

  UserModel({required this.name, this.photoUrl});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map["name"], photoUrl: map["photoUrl"]);
  }

  factory UserModel.fromJson(String json) {
    return UserModel.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toMap() {
    return {"name": this.name, "photoUrl": this.photoUrl};
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}

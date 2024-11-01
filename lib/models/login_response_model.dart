import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final String id;
  final String username;
  final String email;
  final String address;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String token;

  LoginResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        address: json["address"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "address": address,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "token": token,
      };
}

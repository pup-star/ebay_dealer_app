import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) =>
    RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) =>
    json.encode(data.toJson());

class RegistrationModel {
  final String username;
  //final String phone;
  final String email;
  final String password;

  RegistrationModel({
    required this.username,
    //required this.phone,
    required this.email,
    required this.password,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        username: json["username"],
        //phone: json["phone"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        //"phone": phone,
        "email": email,
        "password": password,
      };
}

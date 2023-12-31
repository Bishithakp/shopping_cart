
import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    int id;
    String username;
    String email;
    String firstName;
    String lastName;
    String gender;
    String image;
    String token;

    LoginResponseModel({
        required this.id,
        required this.username,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.image,
        required this.token,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        id: json["id"]??0,
        username: json["username"]??"",
        email: json["email"]??"",
        firstName: json["firstName"]??"",
        lastName: json["lastName"]??"",
        gender: json["gender"]??"",
        image: json["image"]??"",
        token: json["token"]??"",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
        "token": token,
    };
}
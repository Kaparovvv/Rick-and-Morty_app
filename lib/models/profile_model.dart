import 'dart:convert';

class ProfileModel {
    ProfileModel({
        this.id,
        this.firstName,
        this.lastName,
        this.patronymic,
        this.username,
    });

    int? id;
    String? firstName;
    String? lastName;
    String? patronymic;
    String? username;

    factory ProfileModel.fromRawJson(String str) => ProfileModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        patronymic: json["patronymic"] == null ? null : json["patronymic"],
        username: json["username"] == null ? null : json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "patronymic": patronymic == null ? null : patronymic,
        "username": username == null ? null : username,
    };
}

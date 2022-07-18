// To parse this JSON data, do
//
//     final characterModel = characterModelFromJson(jsonString);

import 'dart:convert';

class CharacterModel {
    CharacterModel({
        this.id,
        this.name,
        this.status,
        this.species,
        this.type,
        this.gender,
        this.desc,
        this.race,
        this.origin,
        this.image,
        this.createAt,
    });

    int? id;
    String? name;
    String? status;
    String? species;
    String? type;
    String? gender;
    String? desc;
    String? race;
    int? origin;
    String? image;
    DateTime? createAt;

    factory CharacterModel.fromRawJson(String str) => CharacterModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        status: json["status"] == null ? null : json["status"],
        species: json["species"] == null ? null : json["species"],
        type: json["type"] == null ? null : json["type"],
        gender: json["gender"] == null ? null : json["gender"],
        desc: json["desc"] == null ? null : json["desc"],
        race: json["race"] == null ? null : json["race"],
        origin: json["origin"] == null ? null : json["origin"],
        image: json["image"] == null ? null : json["image"],
        createAt: json["create_at"] == null ? null : DateTime.parse(json["create_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "status": status == null ? null : status,
        "species": species == null ? null : species,
        "type": type == null ? null : type,
        "gender": gender == null ? null : gender,
        "desc": desc == null ? null : desc,
        "race": race == null ? null : race,
        "origin": origin == null ? null : origin,
        "image": image == null ? null : image,
        "create_at": createAt == null ? null : createAt!.toIso8601String(),
    };
}

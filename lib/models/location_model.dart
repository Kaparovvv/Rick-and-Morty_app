import 'dart:convert';

class LocationModel {
    LocationModel({
        this.id,
        this.name,
        this.type,
        this.desc,
        this.dimension,
        this.image,
        this.createAt,
        this.characterLocation,
    });

    int? id;
    String? name;
    String? type;
    String? desc;
    String? dimension;
    String? image;
    DateTime? createAt;
    List<CharacterLocation>? characterLocation;

    factory LocationModel.fromRawJson(String str) => LocationModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        desc: json["desc"] == null ? null : json["desc"],
        dimension: json["dimension"] == null ? null : json["dimension"],
        image: json["image"] == null ? null : json["image"],
        createAt: json["create_at"] == null ? null : DateTime.parse(json["create_at"]),
        characterLocation: json["character_location"] == null ? null : List<CharacterLocation>.from(json["character_location"].map((x) => CharacterLocation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "desc": desc == null ? null : desc,
        "dimension": dimension == null ? null : dimension,
        "image": image == null ? null : image,
        "create_at": createAt == null ? null : createAt!.toIso8601String(),
        "character_location": characterLocation == null ? null : List<dynamic>.from(characterLocation!.map((x) => x.toJson())),
    };
}

class CharacterLocation {
    CharacterLocation({
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

    factory CharacterLocation.fromRawJson(String str) => CharacterLocation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CharacterLocation.fromJson(Map<String, dynamic> json) => CharacterLocation(
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

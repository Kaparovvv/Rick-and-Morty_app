// To parse this JSON data, do
//
//     final episodeModel = episodeModelFromJson(jsonString);

import 'dart:convert';

class EpisodeModel {
  EpisodeModel({
    this.id,
    this.name,
    this.url,
    this.airDate,
    this.episode,
    this.image,
    this.createAt,
    this.characters,
  });

  int? id;
  String? name;
  String? url;
  DateTime? airDate;
  String? episode;
  String? image;
  DateTime? createAt;
  List<int>? characters;

  factory EpisodeModel.fromRawJson(String str) =>
      EpisodeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
        airDate:
            json["air_date"] == null ? null : DateTime.parse(json["air_date"]),
        episode: json["episode"] == null ? null : json["episode"],
        image: json["image"] == null ? null : json["image"],
        createAt: json["create_at"] == null
            ? null
            : DateTime.parse(json["create_at"]),
        characters: json["characters"] == null
            ? null
            : List<int>.from(json["characters"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "url": url == null ? null : url,
        "air_date": airDate == null
            ? null
            : "${airDate!.year.toString().padLeft(4, '0')}-${airDate!.month.toString().padLeft(2, '0')}-${airDate!.day.toString().padLeft(2, '0')}",
        "episode": episode == null ? null : episode,
        "image": image == null ? null : image,
        "create_at": createAt == null ? null : createAt!.toIso8601String(),
        "characters": characters == null
            ? null
            : List<dynamic>.from(characters!.map((x) => x)),
      };
}

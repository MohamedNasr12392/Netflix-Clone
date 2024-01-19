import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'country.dart';

class Network {
  final int? id;
  final String? name;
  final Country? country;
  final String? officialSite;

  Network({
    this.id,
    this.name,
    this.country,
    this.officialSite,
  });

  factory Network.fromRawJson(String str) => Network.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json["id"],
        name: json["name"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        officialSite: json["officialSite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country?.toJson(),
        "officialSite": officialSite,
      };
}

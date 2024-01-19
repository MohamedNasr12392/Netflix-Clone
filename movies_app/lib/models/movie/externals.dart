import 'dart:convert';

class Externals {
  final int? tvrage;
  final int? thetvdb;
  final String? imdb;

  Externals({
    this.tvrage,
    this.thetvdb,
    this.imdb,
  });

  factory Externals.fromRawJson(String str) =>
      Externals.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Externals.fromJson(Map<String, dynamic> json) => Externals(
        tvrage: json["tvrage"],
        thetvdb: json["thetvdb"],
        imdb: json["imdb"],
      );

  Map<String, dynamic> toJson() => {
        "tvrage": tvrage,
        "thetvdb": thetvdb,
        "imdb": imdb,
      };
}

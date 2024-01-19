import 'dart:convert';
import 'package:movies_app/models/movie/movie.dart';
import 'package:movies_app/models/movie/previousepisode.dart';

class Links {
  final Previousepisode? self;
  final Previousepisode? previousepisode;

  Links({
    this.self,
    this.previousepisode,
  });

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null
            ? null
            : Previousepisode.fromJson(json["self"]),
        previousepisode: json["previousepisode"] == null
            ? null
            : Previousepisode.fromJson(json["previousepisode"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self?.toJson(),
        "previousepisode": previousepisode?.toJson(),
      };
}

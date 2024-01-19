import 'dart:convert';

import 'package:movies_app/models/movie/show.dart';

class MovieModel {
  final double? score;
  final Show? show;

  MovieModel({
    this.score,
    this.show,
  });

  factory MovieModel.fromRawJson(String str) =>
      MovieModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        score: json["score"]?.toDouble(),
        show: json["show"] == null ? null : Show.fromJson(json["show"]),
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "show": show?.toJson(),
      };
}

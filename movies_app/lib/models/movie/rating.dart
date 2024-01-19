import 'dart:convert';

import 'package:equatable/equatable.dart';

class Rating {
  final dynamic average;

  Rating({
    this.average,
  });

  factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"],
      );

  Map<String, dynamic> toJson() => {
        "average": average,
      };
}

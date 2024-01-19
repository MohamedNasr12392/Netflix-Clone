import 'dart:convert';

import 'package:equatable/equatable.dart';

class Country {
  final String? name;
  final String? code;
  final String? timezone;

  Country({
    this.name,
    this.code,
    this.timezone,
  });

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "timezone": timezone,
      };
}

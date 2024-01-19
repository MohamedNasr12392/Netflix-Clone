import 'dart:convert';

import 'package:equatable/equatable.dart';

class Schedule {
  final String? time;
  final List<String>? days;

  Schedule({
    this.time,
    this.days,
  });

  factory Schedule.fromRawJson(String str) =>
      Schedule.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: json["time"],
        days: json["days"] == null
            ? []
            : List<String>.from(json["days"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "days": days == null ? [] : List<dynamic>.from(days!.map((x) => x)),
      };
}

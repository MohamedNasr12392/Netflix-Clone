import 'package:equatable/equatable.dart';

class Schedule extends Equatable {
  final String? time;
  final List<String>? days;

  const Schedule({this.time, this.days});

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: json['time'] as String?,
        days: json['days'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'time': time,
        'days': days,
      };

  @override
  List<Object?> get props => [time, days];
}

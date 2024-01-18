import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String? name;
  final String? code;
  final String? timezone;

  const Country({this.name, this.code, this.timezone});

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json['name'] as String?,
        code: json['code'] as String?,
        timezone: json['timezone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'timezone': timezone,
      };

  @override
  List<Object?> get props => [name, code, timezone];
}

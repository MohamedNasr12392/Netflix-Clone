import 'package:equatable/equatable.dart';

import 'country.dart';

class Network extends Equatable {
  final int? id;
  final String? name;
  final Country? country;
  final dynamic officialSite;

  const Network({this.id, this.name, this.country, this.officialSite});

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json['id'] as int?,
        name: json['name'] as String?,
        country: json['country'] == null
            ? null
            : Country.fromJson(json['country'] as Map<String, dynamic>),
        officialSite: json['officialSite'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country?.toJson(),
        'officialSite': officialSite,
      };

  @override
  List<Object?> get props => [id, name, country, officialSite];
}

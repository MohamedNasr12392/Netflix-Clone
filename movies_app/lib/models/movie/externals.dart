import 'package:equatable/equatable.dart';

class Externals extends Equatable {
  final dynamic tvrage;
  final int? thetvdb;
  final String? imdb;

  const Externals({this.tvrage, this.thetvdb, this.imdb});

  factory Externals.fromJson(Map<String, dynamic> json) => Externals(
        tvrage: json['tvrage'] as dynamic,
        thetvdb: json['thetvdb'] as int?,
        imdb: json['imdb'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'tvrage': tvrage,
        'thetvdb': thetvdb,
        'imdb': imdb,
      };

  @override
  List<Object?> get props => [tvrage, thetvdb, imdb];
}

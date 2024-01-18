import 'package:equatable/equatable.dart';

import 'show.dart';

class Movie extends Equatable {
  final double? score;
  final Show? show;

  const Movie({this.score, this.show});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        score: (json['score'] as num?)?.toDouble(),
        show: json['show'] == null
            ? null
            : Show.fromJson(json['show'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'score': score,
        'show': show?.toJson(),
      };

  @override
  List<Object?> get props => [score, show];
}

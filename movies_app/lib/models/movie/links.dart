import 'package:equatable/equatable.dart';

import 'previousepisode.dart';
import 'self.dart';

class Links extends Equatable {
  final Self? self;
  final Previousepisode? previousepisode;

  const Links({this.self, this.previousepisode});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json['self'] == null
            ? null
            : Self.fromJson(json['self'] as Map<String, dynamic>),
        previousepisode: json['previousepisode'] == null
            ? null
            : Previousepisode.fromJson(
                json['previousepisode'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'self': self?.toJson(),
        'previousepisode': previousepisode?.toJson(),
      };

  @override
  List<Object?> get props => [self, previousepisode];
}

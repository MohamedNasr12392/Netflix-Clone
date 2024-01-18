import 'package:equatable/equatable.dart';

class Previousepisode extends Equatable {
  final String? href;

  const Previousepisode({this.href});

  factory Previousepisode.fromJson(Map<String, dynamic> json) {
    return Previousepisode(
      href: json['href'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'href': href,
      };

  @override
  List<Object?> get props => [href];
}

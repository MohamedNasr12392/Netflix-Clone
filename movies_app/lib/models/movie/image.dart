import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final String? medium;
  final String? original;

  const Image({this.medium, this.original});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json['medium'] as String?,
        original: json['original'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'medium': medium,
        'original': original,
      };

  @override
  List<Object?> get props => [medium, original];
}

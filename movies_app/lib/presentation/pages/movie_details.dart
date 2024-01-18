import 'package:flutter/material.dart';
import 'package:movies_app/presentation/widgets/movie_details_body.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MovieDetailsBody(),
    );
  }
}

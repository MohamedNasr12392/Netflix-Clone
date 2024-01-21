import 'package:flutter/material.dart';
import 'package:movies_app/models/movie/movie.dart';
import 'package:movies_app/presentation/widgets/movie_details_body.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen(
      {super.key, required this.movie, required this.moreMoviesLikeThat});

  final MovieModel movie;
  final List<MovieModel> moreMoviesLikeThat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetailsBody(
          movie: movie, moreMoviesLikeThat: moreMoviesLikeThat),
    );
  }
}

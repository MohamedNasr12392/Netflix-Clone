import 'package:flutter/material.dart';
import 'package:movies_app/models/movie/movie.dart';
import 'package:movies_app/presentation/widgets/movie_details_image_and_buttons.dart';
import 'package:movies_app/presentation/widgets/movie_details_name_summary_and_morelikethat.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody(
      {Key? key, required this.movie, required this.moreMoviesLikeThat})
      : super(key: key);

  final MovieModel movie;
  final List<MovieModel> moreMoviesLikeThat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetailImageAndButtons(movie: movie),
              const SizedBox(
                height: 10,
              ),
              MovieDetailNameSummaryAndMoreLikeThat(
                movie: movie,
                moreMoviesLikeThat: moreMoviesLikeThat,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

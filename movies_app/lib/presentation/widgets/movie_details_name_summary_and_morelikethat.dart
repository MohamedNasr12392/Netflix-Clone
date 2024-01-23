import 'package:flutter/material.dart';
import 'package:movies_app/models/movie/movie.dart';
import 'package:movies_app/presentation/widgets/list_view_with_title.dart';

class MovieDetailNameSummaryAndMoreLikeThat extends StatelessWidget {
  const MovieDetailNameSummaryAndMoreLikeThat({
    super.key,
    required this.movie,
    required this.moreMoviesLikeThat,
  });

  final MovieModel movie;
  final List<MovieModel> moreMoviesLikeThat;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Text(
                  movie.show?.name?.toUpperCase() ?? 'No Available Name',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  movie.show!.genres!.join(' • '),
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            movie.show!.summary!,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'More Movies Like That',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListViewWithTitle(
          title: '',
          movies: moreMoviesLikeThat,
        ),
      ],
    );
  }
}

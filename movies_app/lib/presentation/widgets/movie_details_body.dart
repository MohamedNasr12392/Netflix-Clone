import 'package:flutter/material.dart';
import 'package:movies_app/models/movie/movie.dart';
import 'package:movies_app/presentation/widgets/custom_mocie_image.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({
    super.key,
    required this.movie,
  });

  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Hero(
            tag: movie.show!.id.toString(),
            child: CustomMovieImage(
              imageUrl: movie.show!.image?.original.toString() ?? '',
            ),
          )
        ],
      ),
    );
  }
}

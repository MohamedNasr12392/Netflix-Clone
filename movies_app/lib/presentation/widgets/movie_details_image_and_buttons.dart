import 'package:flutter/material.dart';
import 'package:movies_app/models/movie/movie.dart';
import 'package:movies_app/presentation/widgets/custom_movie_image.dart';

class MovieDetailImageAndButtons extends StatelessWidget {
  const MovieDetailImageAndButtons({
    super.key,
    required this.movie,
  });

  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Hero(
              tag: movie.show!.id.toString(),
              child: CustomMovieImage(
                imageUrl: movie.show!.image?.original.toString() ?? '',
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        color: Colors.red,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        'Play now',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity * .5,
                  color: Colors.blueGrey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        color: Colors.red,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.download,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        'Download',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

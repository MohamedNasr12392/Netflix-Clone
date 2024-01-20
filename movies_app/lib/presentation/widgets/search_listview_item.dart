import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/constants/strings.dart';
import 'package:movies_app/models/movie/movie.dart';
import 'package:movies_app/presentation/widgets/custom_movie_image.dart';

class SearchListViewItem extends StatelessWidget {
  const SearchListViewItem({
    super.key,
    required this.movie,
  });

  int calcRate(num rating) {
    return (rating / 2).round();
  }

  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Strings.kMovieDetailsScreen, extra: movie);
      },
      child: Hero(
        tag: movie.show!.id.toString(),
        child: Container(
          padding: const EdgeInsets.only(top: 5),
          color: Colors.transparent,
          height: 200,
          child: Row(
            children: [
              CustomMovieImage(imageUrl: movie.show!.image?.original ?? ''),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    movie.show?.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      movie.show?.rating?.average != null
                          ? Row(children: [
                              ...List.generate(
                                calcRate(movie.show!.rating!.average!),
                                (index) => const Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(Icons.star_purple500_outlined,
                                        size: 15, color: Colors.yellow)),
                              ),
                              ...List.generate(
                                5 - calcRate(movie.show!.rating!.average!),
                                (index) => const Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(Icons.star_purple500_outlined,
                                        size: 15, color: Colors.grey)),
                              ),
                            ])
                          : Row(
                              children: List.generate(
                                5,
                                (index) => const Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Icon(
                                    Icons.star_purple500_outlined,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                      Text(
                        '(${movie.show!.rating!.average})',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.language,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        movie.show!.language!,
                        style: const TextStyle(color: Colors.yellowAccent),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        movie.show!.genres![0],
                        style: const TextStyle(color: Colors.yellowAccent),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.timelapse,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        movie.show!.averageRuntime.toString(),
                        style: const TextStyle(color: Colors.yellowAccent),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

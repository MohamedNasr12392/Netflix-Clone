import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/constants/strings.dart';
import 'package:movies_app/models/movie/movie.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          GoRouter.of(context).push(Strings.kMovieDetailsScreen, extra: movie),
      child: Hero(
        tag: movie.show!.id.toString(),
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: AspectRatio(
                aspectRatio: 2 / 3,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: movie.show!.image?.original.toString() ?? '',
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
          ),
        ),
      ),
    );
  }
}

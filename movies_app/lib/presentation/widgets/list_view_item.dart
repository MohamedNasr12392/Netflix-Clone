import 'package:flutter/cupertino.dart';
import 'package:movies_app/models/movie/movie.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: Image.network(
            movie.show!.image?.original.toString() ?? '',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

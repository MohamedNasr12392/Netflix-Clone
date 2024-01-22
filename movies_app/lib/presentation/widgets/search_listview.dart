import 'package:flutter/material.dart';
import 'package:movies_app/models/movie/movie.dart';
import 'package:movies_app/presentation/widgets/search_listview_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 5, bottom: 10),
            child: SearchListViewItem(
              movie: movies[index],
              moreMoviesLikeThat: movies,
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/presentation/widgets/list_view_item.dart';
import 'package:movies_app/presentation/widgets/list_view_with_title.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, top: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListViewWithTitle(
              title: 'Trending',
            ),
            SizedBox(
              height: 10,
            ),
            ListViewWithTitle(
              title: 'Recommended for you',
            ),
            SizedBox(
              height: 10,
            ),
            ListViewWithTitle(
              title: 'Commedy Movies',
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

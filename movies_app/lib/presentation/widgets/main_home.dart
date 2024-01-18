import 'package:flutter/cupertino.dart';
import 'package:movies_app/presentation/widgets/list_view_with_title.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListViewWithTitle(
          title: 'Trending',
        ),
        SizedBox(
          height: 20,
        ),
        ListViewWithTitle(
          title: 'Recommended for you',
        ),
        SizedBox(
          height: 20,
        ),
        ListViewWithTitle(
          title: 'Commedy Movies',
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

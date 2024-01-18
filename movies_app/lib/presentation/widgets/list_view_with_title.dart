import 'package:flutter/material.dart';
import 'package:movies_app/presentation/widgets/list_view_item.dart';

class ListViewWithTitle extends StatelessWidget {
  const ListViewWithTitle({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) => const ListViewItem(),
          ),
        )
      ],
    );
  }
}

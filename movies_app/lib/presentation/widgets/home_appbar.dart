import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight + 30),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      leading: const Icon(
        CupertinoIcons.line_horizontal_3_decrease,
        color: Colors.white,
        size: 20,
      ),
      title: Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/7/7a/Logonetflix.png',
        height: 30,
      ),
      centerTitle: true,
      bottom: const TabBar(
        isScrollable: true,
        indicatorColor: Colors.red,
        dividerColor: Colors.transparent,
        tabs: [
          Text(
            'TV Shows',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          Text(
            'Movies',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          Text(
            'MyList',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          Text(
            'Kids',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

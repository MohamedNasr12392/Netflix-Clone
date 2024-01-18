import 'package:flutter/cupertino.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: Image.asset(
            'assets/images/107.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

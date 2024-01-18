import 'package:flutter/material.dart';
import 'package:movies_app/presentation/widgets/home_appbar.dart';
import 'package:movies_app/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: DefaultTabController(
        length: 4,
        animationDuration: Duration(seconds: 1),
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: CustomAppBar(),
          body: HomeScreenBody(),
        ),
      ),
    );
  }
}

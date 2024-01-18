import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/constants/strings.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Lottie.network(
          'https://lottie.host/f2d08d7b-088a-452f-8d5e-9455be0eec8c/WDXlrxe5qk.json',
          controller: _animationController, onLoaded: (lottieComposition) {
        _animationController
          ..duration = lottieComposition.duration
          ..forward().whenComplete(
            () => GoRouter.of(context).pushReplacement(
              Strings.kHomeScreen,
            ),
          );
      }, repeat: false),
    );
  }
}

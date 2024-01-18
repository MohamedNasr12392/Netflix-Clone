import 'package:go_router/go_router.dart';
import 'package:movies_app/core/constants/strings.dart';
import 'package:movies_app/presentation/pages/home_screen.dart';
import 'package:movies_app/presentation/pages/movie_details.dart';
import 'package:movies_app/presentation/pages/splash_screen.dart';

abstract class AppRouter {
// GoRouter configuration

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Strings.kSplashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Strings.kHomeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Strings.kMovieDetailsScreen,
        builder: (context, state) => const MovieDetailsScreen(),
      ),
    ],
  );
}

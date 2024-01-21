import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/controllers/home_cubit/home_cubit_cubit.dart';
import 'package:movies_app/core/constants/strings.dart';
import 'package:movies_app/models/movie/movie.dart';
import 'package:movies_app/presentation/pages/home_screen.dart';
import 'package:movies_app/presentation/pages/movie_details.dart';
import 'package:movies_app/presentation/pages/search_screen.dart';
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
          builder: (context, state) {
            final List<dynamic> extras = state.extra as List<dynamic>;
            final MovieModel movie = extras[0] as MovieModel;
            final List<MovieModel> moreMoviesLikeThat =
                extras[1] as List<MovieModel>;

            return MovieDetailsScreen(
              movie: movie,
              moreMoviesLikeThat: moreMoviesLikeThat,
            );
          }),
      GoRoute(
        path: Strings.kSearchScreen,
        builder: (context, state) => const SearchScreen(),
      ),
    ],
  );
}

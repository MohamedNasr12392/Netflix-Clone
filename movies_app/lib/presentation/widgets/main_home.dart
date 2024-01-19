import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controllers/home_cubit/home_cubit_cubit.dart';
import 'package:movies_app/presentation/widgets/list_view_with_title.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    homeCubit.getMovies(); // Call the function directly

    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        if (state is GetMoviesErrorState) {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMsg)));
            print(state.errorMsg);
          });
          return const SizedBox();
        }
        if (state is GetMoviesSuccessState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListViewWithTitle(
                title: 'Trending',
                movies: state.movies,
              ),
              const SizedBox(
                height: 20,
              ),
              ListViewWithTitle(
                title: 'Recommended for you',
                movies: state.movies,
              ),
              const SizedBox(
                height: 20,
              ),
              ListViewWithTitle(
                title: 'Comedy Movies',
                movies: state.movies,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controllers/home_cubit/home_cubit_cubit.dart';
import 'package:movies_app/presentation/widgets/search_listview.dart';

class SearchScreenBody extends StatelessWidget {
  SearchScreenBody({super.key});

  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                              gapPadding: 0,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 20,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            alignLabelWithHint: true,
                          ),
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            searchQuery = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          searchQuery = searchController.text;
                          context
                              .read<HomeCubit>()
                              .searchForMovies(searchQuery);
                        },
                        child: Container(
                          height: 38,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xffF62E1F),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.76,
                  child: BlocBuilder<HomeCubit, HomeCubitState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        );
                      } else if (state is SearchMoviesSuccessState) {
                        return SearchListView(
                          movies: state.moviesList,
                        );
                      }
                      return Container();
                    },
                  ),
                )
              ],
            )));
  }
}

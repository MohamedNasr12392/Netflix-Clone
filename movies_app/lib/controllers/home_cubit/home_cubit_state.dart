part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {}

class HomeCubitInitial extends HomeCubitState {}

class BottomNavBarClicked extends HomeCubitState {
  final int index;

  BottomNavBarClicked({required this.index});
}

class LoadingState extends HomeCubitState {}

class GetMoviesSuccessState extends HomeCubitState {
  final List<List<MovieModel>> moviesLists;

  GetMoviesSuccessState({required this.moviesLists});
}

class GetMoviesErrorState extends HomeCubitState {
  final String errorMsg;

  GetMoviesErrorState({required this.errorMsg});
}

class SearchMoviesSuccessState extends HomeCubitState {
  final List<MovieModel> moviesList;

  SearchMoviesSuccessState({required this.moviesList});
}

class SearchMoviesErrorState extends HomeCubitState {
  final String errorMsg;

  SearchMoviesErrorState({required this.errorMsg});
}

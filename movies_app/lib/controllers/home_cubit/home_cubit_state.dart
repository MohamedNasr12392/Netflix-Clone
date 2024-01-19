part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {}

class HomeCubitInitial extends HomeCubitState {}

class BottomNavBarClicked extends HomeCubitState {}

class LoadingState extends HomeCubitState {}

class GetMoviesSuccessState extends HomeCubitState {
  final List<MovieModel> movies;

  GetMoviesSuccessState({required this.movies});
}

class GetMoviesErrorState extends HomeCubitState {
  final String errorMsg;

  GetMoviesErrorState({required this.errorMsg});
}
